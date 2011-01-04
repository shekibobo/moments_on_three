class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    Category.create :name => "family"
    Category.create :name => "children"
    Category.create :name => "pets"
    Category.create :name => "headshots"
    Category.create :name => "seniors"
    Category.create :name => "theatre"
    Category.create :name => "weddings"
  end

  def self.down
    drop_table :categories
  end
end
