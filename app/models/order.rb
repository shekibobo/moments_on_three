class Order < ActiveRecord::Base
  attr_accessible :user_id, :committed, :paid
  belongs_to :user
  has_many :order_items, :dependent => :destroy

  def subtotal
    self.order_items.sum { |i| i.subtotal }
  end

  def total
    tax = 0.06
    self.subtotal * (1 + tax)
  end
end
