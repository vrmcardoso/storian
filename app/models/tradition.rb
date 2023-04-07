class Tradition < ApplicationRecord
  belongs_to :world
  has_many :tradition_nations
  has_many :nations, through: :tradition_nations
  has_many :tradition_races
  has_many :races, through: :tradition_races
end
