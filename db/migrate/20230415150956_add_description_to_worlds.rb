class AddDescriptionToWorlds < ActiveRecord::Migration[7.0]
  def change
    add_column :worlds, :description, :text
  end
end
