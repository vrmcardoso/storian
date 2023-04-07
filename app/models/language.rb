class Language < ApplicationRecord
  belongs_to :world
  has_many :character_languages
  has_many :characters, through: :character_languages
  has_many :language_races
  has_many :races, through: :language_races
  has_many :language_nations
  has_many :nations, through: :language_nations
end
