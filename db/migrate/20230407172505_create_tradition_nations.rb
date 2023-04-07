class CreateTraditionNations < ActiveRecord::Migration[7.0]
  def change
    create_table :tradition_nations do |t|
      t.references :tradition, null: false, foreign_key: true
      t.references :nation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
