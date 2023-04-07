class Series < ApplicationRecord
  belongs_to :world
  has_many :books, as: :bookable
end
