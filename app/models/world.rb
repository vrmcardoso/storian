class World < ApplicationRecord
  belongs_to :user
  has_many :maps
  has_many :races
  has_many :nations
  has_many :books, as: :bookable
  has_many :series
  has_many :languages
  has_many :traditions
  has_many :magic_systems
  has_many :characters
  has_many :historical_timelines
  has_many :locations
  has_many :religions
end
