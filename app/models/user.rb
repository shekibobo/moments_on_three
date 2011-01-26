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
end
