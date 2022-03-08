class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :owner_id, null: false
      t.string :prefecture_id
      t.string :city
      t.string :level
      t.string :age
      t.string :member_count
      t.text :introduction
      t.string :activities_time
      t.string :founded
      t.timestamps
    end
  end
end
