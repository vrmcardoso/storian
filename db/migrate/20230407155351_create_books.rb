class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.references :bookable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
