class Series < ApplicationRecord
  belongs_to :world
  belongs_to :user
  has_many :books
  has_one_attached :photo
end
