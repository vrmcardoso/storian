class Nation < ApplicationRecord
  belongs_to :world
  has_many :language_nations
  has_many :languages, through: :language_nations
  has_many :traditions
  has_many :locations
  has_many :nation_races
  has_many :races, through: :nation_races
  has_many :religion_nations
  has_many :religions, through: :religion_nations
  has_many :tradition_nations
  has_many :traditions, through: :tradition_nations
end
