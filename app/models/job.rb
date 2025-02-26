class Job < ApplicationRecord
  has_many :resumes, dependent: :nullify # Allow resumes to retain reference
  has_one :deleted_job

  after_destroy :move_to_deleted_jobs # Change from `before_destroy` to `after_destroy`

  private

  def move_to_deleted_jobs
    deleted_job = DeletedJob.create!(
      title: title,
      location: location,
      description: description,
      job_type: job_type,
      status: status,
      image: image
    )

    # Update resumes to store deleted_job_id reference
    resumes.update_all(deleted_job_id: deleted_job.id)
  end
end
