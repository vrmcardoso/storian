class AddDetailsToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :physical_description, :text
    add_column :characters, :personality_description, :text
    add_column :characters, :traits_and_quirks, :text
    add_column :characters, :backstory, :text
    add_reference :characters, :place_of_birth, foreign_key: { to_table: :locations }
    add_reference :characters, :nationality, foreign_key: { to_table: :nations }
    add_reference :characters, :race, foreign_key: true
    add_reference :characters, :religion, foreign_key: true
  end
end
