class OrderItem < ActiveRecord::Base
  attr_accessible :photo_id, :print_id, :quantity

  belongs_to :order
  belongs_to :photo
  has_one :print

  def subtotal
    print.cost * quantity
  end
end
