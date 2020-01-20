class Comment < ApplicationRecord
  belongs_to :user_id
  belongs_to :article_id
  validates :content, presence: true # maybe also need uniquness scope {article}
end
