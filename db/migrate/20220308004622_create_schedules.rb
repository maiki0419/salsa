class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :team, null: false
      t.string :title, null: false
      t.datetime :starts_at
      t.datetime :ends_at
      t.timestamps
    end
  end
end
