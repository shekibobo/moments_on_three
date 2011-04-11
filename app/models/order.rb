class Order < ActiveRecord::Base
  attr_accessible :user_id, :paid
  belongs_to :user
  has_many :order_items
end
