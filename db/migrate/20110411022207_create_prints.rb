class CreatePrints < ActiveRecord::Migration
  def self.up
    create_table :prints do |t|
      t.string :description
      t.decimal :cost, :precision => 8, :scale => 2
      t.timestamps
    end

    Print.create :description => "Wallets - Sheet of 8", :cost => 15.00
    Print.create :description => "4 x 6", :cost => 10.00
    Print.create :description => "5 x 7", :cost => 15.00
    Print.create :description => "8 x 10", :cost => 25.00
    Print.create :description => "11 x 14", :cost => 75.00
  end

  def self.down
    drop_table :prints
  end
end
