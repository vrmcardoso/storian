class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.text :description
      t.date :date
      t.references :historical_timeline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
