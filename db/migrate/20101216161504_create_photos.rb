class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :gallery_id
      t.string :name
      t.string :orientation
      t.integer :rating, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
