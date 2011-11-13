class OrderItem < ActiveRecord::Base
  attr_accessible :photo_id, :print_id, :quantity

  belongs_to :order
  belongs_to :photo
  belongs_to :print

  def subtotal
    # a 20% discount is applied if 6 or more of the same print is ordered
    print.cost * quantity * (discount? ? 0.8 : 1.0)
  end

  def discount?
    quantity >= 6 || first_30_days?
  end

  private

  def first_30_days?
    Time.now - photo.gallery.created_at < 30.days
  end

end
