class Photo < ActiveRecord::Base

  acts_as_taggable

  has_attached_file :image,
    :styles => { :original => "500x500>", :small => "150x150>" },
    :path => ":rails_root/public/assets/galleries/:user/:gallery/:style/:basename.:extension",
    :url => "/assets/galleries/:user/:gallery/:style/:basename.:extension",
    :default_url => '/public/images/missing.png'

  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => 'image/jpeg'

  before_create :set_orientation

  attr_accessible :gallery_id, :name, :rating, :image, :tag_list, :orientation

  belongs_to :gallery
  validates_associated :gallery

  def name
    super
    @name = image.original_filename.gsub(/(std)?\..*/, '').humanize
  end

  def category
    Category.find(gallery.category_id)
  end

  protected

  def set_orientation
    original_image = self.image.to_file(:original)
    dimensions = Paperclip::Geometry.from_file(original_image)
    self.orientation = (dimensions.width > dimensions.height) ? 'landscape' : 'portrait'
  end

end
