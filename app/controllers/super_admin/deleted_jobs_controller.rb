class SuperAdmin::DeletedJobsController < ApplicationController
  def index
    deleted_jobs = DeletedJob.all.map do |deleted_job|
      {
        id: deleted_job.id,
        title: deleted_job.title,
        location: deleted_job.location,
        description: deleted_job.description,
        job_type: deleted_job.job_type,
        status: deleted_job.status,
        image: deleted_job.image,
        resumes: Resume.where(deleted_job_id: deleted_job.id).map do |resume|
          {
            id: resume.id,
            name: resume.name,
            email: resume.email,
            file_url: resume.resume_file.attached? ? url_for(resume.resume_file) : nil
          }
        end
      }
    end

    render json: deleted_jobs
  end

  def destroy
    deleted_job = DeletedJob.find_by(id: params[:id])

    if deleted_job
      Resume.where(deleted_job_id: deleted_job.id).destroy_all
      deleted_job.destroy

      render json: { message: "Job permanently deleted", id: params[:id] }, status: :ok
    else
      render json: { error: "Job not found" }, status: :not_found
    end
  end

  def restore
    deleted_job = DeletedJob.find_by(id: params[:id])

    if deleted_job
      restored_job = Job.create!(
        title: deleted_job.title,
        location: deleted_job.location,
        description: deleted_job.description,
        job_type: deleted_job.job_type,
        status: deleted_job.status,
        image: deleted_job.image
      )

      Resume.where(deleted_job_id: deleted_job.id).update_all(job_id: restored_job.id, deleted_job_id: nil)

      deleted_job.destroy

      render json: { message: "Job restored successfully", id: params[:id] }, status: :ok
    else
      render json: { error: "Job not found" }, status: :not_found
    end
  end
end
