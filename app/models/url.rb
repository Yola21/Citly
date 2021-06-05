class URL < ApplicationRecord
  validates :url, presence: true, length: { maximum: 500 }
  validates :slug, uniqueness: true
end