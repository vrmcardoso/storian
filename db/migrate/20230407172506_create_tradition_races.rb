class CreateTraditionRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :tradition_races do |t|
      t.references :tradition, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true

      t.timestamps
    end
  end
end
