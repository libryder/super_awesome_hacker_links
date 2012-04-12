class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.references :user
      t.string :description
      t.integer :rating

      t.timestamps
    end
    add_index :links, :user_id
  end
end
