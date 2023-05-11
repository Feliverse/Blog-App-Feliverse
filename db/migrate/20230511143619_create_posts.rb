class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.references :autor, null: false, foreign_key: true
      t.integer :comment_counter
      t.integer :like_counter

      t.timestamps
    end
  end
end
