class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # Gallery stuff
  has_many :owned_galleries, :class_name => 'Gallery', :foreign_key => 'owner_id'
  has_many :permissions, :foreign_key => 'shared_user_id'
  has_many :shared_galleries, :class_name => 'Gallery',
    :through => :permissions, :foreign_key => 'shared_user_id'

  def can_share?(gallery)
    gallery.owner?(self) || self.permission(gallery).to_share?
  end

  def can_view?(gallery)
    gallery.owner?(self) || self.permission(gallery)
  end

  def can_vote?(gallery)
    gallery.owner?(self) || self.permission(gallery).to_vote?
  end

  def can_purchase(gallery)
    gallery.owner?(self) || self.permission(gallery).to_purchase?
  end

  def permission(gallery)
    self.permissions.find_by_shared_gallery_id(gallery.id)
  end
end
