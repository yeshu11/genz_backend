class DeletedJob < ApplicationRecord
  belongs_to :job, optional: true # Allows job_id to be nil
  # has_many :resumes, foreign_key: :job_id, primary_key: :job_id # Link resumes to deleted job
  has_many :resumes, foreign_key: :deleted_job_id # Now references `deleted_job_id`
  scope :only_deleted, -> { where.not(deleted_at: nil) }
end
