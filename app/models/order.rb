class Order < ActiveRecord::Base
  attr_accessible :user_id, :committed, :paid
  belongs_to :user
  has_many :order_items, :dependent => :destroy

  def subtotal
    order_items.collect{|i| i.subtotal}.inject(:+)
  end

  def total
    tax = 0.06
    subtotal * (1 + tax)
  end
end
