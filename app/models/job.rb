class Job < ApplicationRecord
  has_many :resumes, dependent: :nullify # Allow resumes to retain reference
  has_one :deleted_job
end
