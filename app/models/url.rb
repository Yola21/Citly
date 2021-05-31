class URL < ApplicationRecord
  validates :url, presence: true
  validates :url, presence: true, length: { maximum: 500 }
end