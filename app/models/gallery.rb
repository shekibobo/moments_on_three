class Gallery < ActiveRecord::Base
  require 'rubygems'
  require 'zip/zip'

  attr_accessible :name, :owner_id, :shoot_date, :description,
    :category_id, :archive

  

  has_attached_file :archive,
    :path => ":rails_root/public/:attachment/:basename.:extension"
  validates_attachment_content_type :archive, :content_type => 'application/zip'
  validates_attachment_presence :archive

  # destroy all photos when a gallery is destroyed
  has_many :photos, :dependent => :destroy
  belongs_to :category

  def extract_photos (options = {})
    export_path = archive.path.gsub('.zip', '_content')

    Zip::ZipFile.open(archive.path) { |zip_file|
      zip_file.each { |image|
        image_path = File.join(export_path, image.name)
        FileUtils.mkdir_p(File.dirname(image_path))
        unless File.exist?(image_path)
          zip_file.extract(image, image_path)
          photo = photos.build
          photo.image = File.open(image_path)
          # photo.name = photo.image.original_filename.gsub(/\..*/, '')
          # photo.tag_list = [ Category.find(category_id).name ]
          photo.save
        end
      }
    }
    # clean up source files, but leave the zip
    FileUtils.remove_dir(export_path)
  end

end
