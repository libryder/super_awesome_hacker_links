class SetDefaultForRatingColumn < ActiveRecord::Migration
  def up
    change_column(:links, :rating, :integer, :default => 0, :null => false)
  end

  def down
    change_column(:links, :rating, :integer, :default => nil, :null => true)
  end
end
