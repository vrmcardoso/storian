class AddDescriptionToRaces < ActiveRecord::Migration[7.0]
  def change
    add_column :races, :description, :text
  end
end
