class Job < ApplicationRecord
  has_many :resumes, dependent: :nullify # Allow resumes to retain reference
  has_one :deleted_job

  # REMOVE this callback to prevent duplicate entries
  # after_destroy :move_to_deleted_jobs

  private

  # REMOVE this method as it’s now redundant
  # def move_to_deleted_jobs
  #   deleted_job = DeletedJob.create!(
  #     title: title,
  #     location: location,
  #     description: description,
  #     job_type: job_type,
  #     status: status,
  #     image: image
  #   )
  #   resumes.update_all(deleted_job_id: deleted_job.id)
  # end
end
