class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :print_id, :quantity

  belongs_to :order
  has_and_belongs_to_many :photos
  belongs_to :print
end
