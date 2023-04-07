class AddPenNameToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :pen_name, null: false, foreign_key: true
  end
end
