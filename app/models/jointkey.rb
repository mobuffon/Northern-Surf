class Jointkey < ApplicationRecord
  belongs_to :keyword
  belongs_to :article
end
