class Uspot < ApplicationRecord
  validates :user_id, uniqueness: { scope: :spot,
    message: "You already have this user_spot" }
  belongs_to :user
  belongs_to :spot
end
