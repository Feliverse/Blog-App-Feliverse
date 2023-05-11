class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.references :author, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
