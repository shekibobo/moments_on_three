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

  def extract (file = nil)
    Zip::ZipFile.open(file) { |zip_file|
      zip_file.each { |image|
        photo = self.photos.build
        photo.image = File.new(image)
        photo.save
      }
    }
  end

  def owner?(user)
    self.owner == user
  end

end
