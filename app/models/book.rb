class Book < ApplicationRecord
  belongs_to :world
  belongs_to :pen_name
  belongs_to :series, optional: true
  has_many :book_characters
  has_many :characters, through: :book_characters
  has_one_attached :cover
end
