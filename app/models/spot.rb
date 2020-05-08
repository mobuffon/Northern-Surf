class Spot < ApplicationRecord
  validates :location, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true

  has_many :uspots
  has_many :users, through: :uspots
end
