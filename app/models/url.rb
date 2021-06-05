class Url < ApplicationRecord
  validates :url, presence: true, length: { maximum: 250 }
  validates :shortened_url, presence: true
  validates :slug, uniqueness: true
end