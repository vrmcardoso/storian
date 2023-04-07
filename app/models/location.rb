class Location < ApplicationRecord
  belongs_to :world
  belongs_to :nation
end
