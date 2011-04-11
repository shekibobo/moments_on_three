class CreatePrints < ActiveRecord::Migration
  def self.up
    create_table :prints do |t|
      t.string :description
      t.decimal :cost, :precision => 8, :scale => 2
      t.timestamps
    end

    Print.create :description => "Wallets - sheet of 8", :cost => 15.00
    Print.create :description => "4x6", :cost => 10.00
    Print.create :description => "5x7", :cost => 15.00
    Print.create :description => "8x10", :cost => 25.00
    Print.create :description => "11x14", :cost => 75.00
    Print.create :description => "Proof CD", :cost => 30.00
  end

  def self.down
    drop_table :prints
  end
end
