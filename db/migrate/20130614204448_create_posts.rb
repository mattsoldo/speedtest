class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :order
      t.decimal :amount
      t.string :summary

      t.timestamps
    end
  end
end
