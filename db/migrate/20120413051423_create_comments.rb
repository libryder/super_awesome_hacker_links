class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :link
      t.text :body

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :link_id
  end
end
