class Character < ApplicationRecord
  belongs_to :world
  has_many :book_characters
  has_many :books, through: :book_characters
  belongs_to :place_of_birth, class_name: 'Location'
  belongs_to :nationality, class_name: 'Nation'
  belongs_to :race
  belongs_to :religion
  has_many :character_languages
  has_many :languages, through: :character_languages
  has_one_attached :profile_photo
end
