class Print < ActiveRecord::Base
  attr_accessible :description, :cost
  has_many :order_items
end
