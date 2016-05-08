class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :body
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
