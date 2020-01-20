class Article < ApplicationRecord
  belongs_to :user
  serialize :content
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true, uniqueness: true
end
