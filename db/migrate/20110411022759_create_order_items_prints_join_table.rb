class CreateOrderItemsPrintsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :order_items_prints, :id => false do |t|
      t.integer :order_item_id
      t.integer :print_id
    end
  end

  def self.down
    drop_table :order_items_prints
  end
end
