class Religion < ApplicationRecord
  belongs_to :world
  has_many :religion_nations
  has_many :nations, through: :religion_nations
  has_many :religion_races
  has_many :races, through: :religion_races
end
