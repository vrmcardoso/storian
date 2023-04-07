class CreateNationRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :nation_races do |t|
      t.references :nation, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true

      t.timestamps
    end
  end
end
