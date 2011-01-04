class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    Category.create :name => "Family"
    Category.create :name => "Children"
    Category.create :name => "Pets"
    Category.create :name => "Headshots"
    Category.create :name => "Seniors"
    Category.create :name => "Theatre"
    Category.create :name => "Weddings"
  end

  def self.down
    drop_table :categories
  end
end
