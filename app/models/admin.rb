class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :registerable, :recoverable,
  # :rememberable, :validatable
  devise :database_authenticatable, :trackable,:timeoutable, :lockable

  # Setup accessible (or protected) attributes for your model
  #  can also use :remember_me
  attr_accessible :email, :password, :password_confirmation
end
