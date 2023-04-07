class HistoricalTimeline < ApplicationRecord
  belongs_to :world
  has_many :events, dependent: :destroy
end
