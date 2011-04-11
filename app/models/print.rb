class Print < ActiveRecord::Base
  attr_accessible :description, :cost
  # associated_with_many :order items
  has_many :order_items
end
