class Job < ApplicationRecord
  belongs_to :company
  belongs_to :location

  has_many :job_categories, dependent: :destroy
  has_many :categories, through: :job_categories

  validates :title, presence: true
  validates :original_url, presence: true, uniqueness: true
end
