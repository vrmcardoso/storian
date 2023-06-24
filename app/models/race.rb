class Race < ApplicationRecord
  belongs_to :world
  has_many :language_races
  has_many :languages, through: :language_races
  has_many :nation_races
  has_many :nations, through: :nation_races
  has_many :religion_races
  has_many :religions, through: :religion_races
  has_many :tradition_races
  has_many :traditions, through: :tradition_races
  has_one_attached :image
end
