class Job < ApplicationRecord
  # Remove the line that attaches an image
  # has_one_attached :image

  validates :title, :description, :location, :job_type, :status, presence: true
end
