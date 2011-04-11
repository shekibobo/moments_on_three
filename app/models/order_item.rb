class OrderItem < ActiveRecord::Base
  attr_accessible :photo_id, :print_id, :quantity

  belongs_to :order
  belongs_to :photo
  belongs_to :print

  def subtotal
    self.print.cost * self.quantity
  end
end
