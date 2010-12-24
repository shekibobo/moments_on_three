class Photo < ActiveRecord::Base
  before_save :name

  acts_as_taggable

  has_attached_file :image,
    :styles => { :original => "500x500>", :small => "150x150>" },
    :path => ":rails_root/public/galleries/:gallery/:style/:basename.:extension",
    :url => "/galleries/:gallery/:style/:basename.:extension"
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => 'image/jpeg'

  attr_accessible :gallery_id, :name, :rating, :image, :tag_list

  belongs_to :gallery
  validates_associated :gallery

  def name
    super
    @name = image.original_filename.gsub(/(std)?\..*/, '').humanize
  end
end
