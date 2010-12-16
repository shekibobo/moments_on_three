class Photo < ActiveRecord::Base
  has_attached_file :image,
    :styles => { :original => "500x500>", :small => "150x150>" },
    :path => ":rails_root/public/galleries/:gallery/:style/:basename.:extension",
    :url => "/galleries/:gallery/:style/:basename.:extension"
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => 'image/jpeg'

  attr_accessible :gallery_id, :name, :rating, :image

  belongs_to :gallery
  validates_associated :gallery
end
