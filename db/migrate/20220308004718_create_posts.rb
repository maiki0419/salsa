class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :customer, null: false
      t.integer :team_id
      t.string :post_categroy, null: false
      t.string :title, null: false
      t.text :body
      t.string :start_date
      t.string :deadline, null: false
      t.string :prefecture_id, null: false
      t.string :city
      t.string :capacity
      t.string :place
      t.timestamps
    end
  end
end
