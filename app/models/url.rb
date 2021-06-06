class Url < ApplicationRecord
  validates :url, presence: true, format: URI::regexp(%w[http https]), length: { maximum: 250 }
  validates :shortened_url, format: URI::regexp(%w[http https]), presence: true
  validates :slug, uniqueness: true
end