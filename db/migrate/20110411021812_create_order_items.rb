class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :photo_id
      t.integer :print_id
      t.integer :quantity, :default => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :order_items
  end
end
