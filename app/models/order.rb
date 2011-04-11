class Order < ActiveRecord::Base
  attr_accessible :user_id, :committed, :paid
  belongs_to :user
  has_many :order_items, :dependent => :destroy
end
