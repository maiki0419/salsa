class CreateTeamCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_customers do |t|
      t.references :customer, null: false
      t.references :team, null: false
      t.timestamps
    end
  end
end
