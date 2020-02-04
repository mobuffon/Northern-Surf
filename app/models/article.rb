class Article < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :jointkey
  has_many :keyword, through: :jointkey
  belongs_to :user
  # has_one_attached :photo
  serialize :content
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true, uniqueness: true
end
