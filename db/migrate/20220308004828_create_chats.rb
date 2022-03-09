class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.references :room, null: false
      t.references :customer, null: false
      t.text :message, null: false
      t.timestamps
    end
  end
end
