class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.string :title
      t.integer :user_id
      t.date :shoot_date
      t.text :description
      t.integer :category_id
      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
