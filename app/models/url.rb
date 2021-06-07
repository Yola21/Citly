class Url < ApplicationRecord
  validates :url, presence: true, format: URI::regexp(%w[http https]), length: { maximum: 250 }
  validates :shortened_url, format: URI::regexp(%w[http https]), presence: true
  validates :slug, uniqueness: true, presence: true
  enum status: { unpinned: 0, pinned: 1 }

  private

  def self.organize
    pinned = self.pinned.order('updated_at DESC')
    unpinned = self.unpinned
    pinned + unpinned
  end
end