class Gallery < ActiveRecord::Base
  require 'rubygems'
  require 'zip/zip'

  attr_accessible :name, :owner_id, :shoot_date, :description,
    :category_id, :archive

  # stuff about users
  belongs_to :owner, :class_name => 'User'
  has_many :permissions, :foreign_key => 'shared_gallery_id',
    :dependent => :destroy
  has_many :shared_users, :class_name => 'User',
    :through => :permissions, :foreign_key => 'shared_user_id'

  has_attached_file :archive,
      :path => ":rails_root/public/assets/:attachment/:basename.:extension",
      :styles => {:original => {:processors => [:extractor]}}

  validates_attachment_content_type :archive, :content_type => 'application/zip'

  # destroy all photos when a gallery is destroyed
  has_many :photos, :dependent => :destroy
  belongs_to :category

  ## extract photos from the zip file and add it to the gallery.
  def extract (file = nil)
    export_path = archive.path.gsub('.zip', '_content')

    Zip::ZipFile.open(file.path) { |zip_file|
      zip_file.each { |image|
        image_path = File.join(export_path, image.name)
        FileUtils.mkdir_p(File.dirname(image_path))
        unless File.exist?(image_path)
          zip_file.extract(image, image_path)
          photo = photos.build
          photo.image = File.open(image_path)
          photo.save
          File.delete(image_path)
        end
      }
    }
    # clean up source files, but leave the zip
    FileUtils.remove_dir(export_path)
  end

  ## This doesn't work. This is an attempt to perform the :extract method
  ## without having to write an actual file to the disk first.
  def extract_new (file = nil)
    Zip::ZipFile.open(file) { |zip_file|
      zip_file.each { |image|
        photo = self.photos.build
        photo.image = image.get_input_stream
        photo.save
      }
    }
  end

  def owner?(user)
    self.owner == user
  end

end
