class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :subtotal, :default => 0.00
      t.decimal :total, :default => 0.00
      t.boolean :committed, :default => false
      t.boolean :paid, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
