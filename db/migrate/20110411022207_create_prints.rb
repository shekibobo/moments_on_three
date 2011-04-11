class CreatePrints < ActiveRecord::Migration
  def self.up
    create_table :prints do |t|
      t.string :description
      t.decimal :cost
      t.timestamps
    end
  end

  def self.down
    drop_table :prints
  end
end
