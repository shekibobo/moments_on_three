class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :print_id, :quantity

  belongs_to :order
  has_and_belongs_to_many :photos
  belongs_to :print

  def subtotal
    self.print.cost * self.quantity
  end
end
