class AddSeriesIdToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :series, foreign_key: true, null: true
  end
end
