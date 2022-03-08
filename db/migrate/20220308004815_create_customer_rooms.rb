class CreateCustomerRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_rooms do |t|
      t.references :customer, null: false
      t.references :room, null: false
      t.timestamps
    end
  end
end
