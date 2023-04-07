class CreateReligionRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :religion_races do |t|
      t.references :religion, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true

      t.timestamps
    end
  end
end
