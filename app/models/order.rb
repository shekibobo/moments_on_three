class Order < ActiveRecord::Base
  attr_accessible :user_id, :committed, :paid, :subtotal, :total

  before_save :subtotal=
  before_save :total=

  belongs_to :user
  has_many :order_items, :dependent => :destroy

  def subtotal=()
    self[:subtotal] = order_items.collect{|i| i.subtotal}.inject(:+) || 0
  end

  def total=()
    tax = 0.06
    self[:total] = subtotal * (1 + tax)
  end
end
