class UpdateBooksTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :world, foreign_key: true
    remove_column :books, :bookable_id
    remove_column :books, :bookable_type
  end
end
