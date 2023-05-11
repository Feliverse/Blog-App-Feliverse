class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :user, foreign_key: true, index: true
      t.references :post, foreign_key: true, index: true
      
      t.timestamps
    end
  end
end
