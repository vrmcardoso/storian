class Book < ApplicationRecord
  belongs_to :bookable, polymorphic: true
  belongs_to :pen_name
  has_many :book_characters
  has_many :characters, through: :book_characters
  has_one_attached :cover
end
