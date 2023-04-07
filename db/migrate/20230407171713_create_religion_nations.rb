class CreateReligionNations < ActiveRecord::Migration[7.0]
  def change
    create_table :religion_nations do |t|
      t.references :religion, null: false, foreign_key: true
      t.references :nation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
