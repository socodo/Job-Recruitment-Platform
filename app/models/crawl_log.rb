class CrawlLog < ApplicationRecord
  enum :status, {
    pending: 'pending',
    running: 'running',
    completed: 'completed',
    failed: 'failed'
  }
  validates :source, presence: true
  validates :status, presence: true
end
