class CreateLanguageNations < ActiveRecord::Migration[7.0]
  def change
    create_table :language_nations do |t|
      t.references :language, null: false, foreign_key: true
      t.references :nation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
