class CreateMagicSystems < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_systems do |t|
      t.string :name
      t.references :world, null: false, foreign_key: true

      t.timestamps
    end
  end
end
