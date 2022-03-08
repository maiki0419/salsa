class CreateTeamRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :team_records do |t|
      t.references :team, null: false
      t.string :day, null: false
      t.string :place, null: false
      t.string :opponent, null:false
      t.string :score, null:false
      t.string :note
      t.string :result, null:false
      t.timestamps
    end
  end
end
