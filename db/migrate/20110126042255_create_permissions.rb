class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.integer :shared_user_id, :null => false
      t.integer :shared_gallery_id, :null => false
      t.boolean :to_view, :default => true
      t.boolean :to_vote, :default => true
      t.boolean :to_share, :default => false
      t.boolean :to_purchase, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :permissions
  end
end
