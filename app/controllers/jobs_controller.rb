class JobsController < ApplicationController
  def index
    @jobs = Job.all
    render json: @jobs
  end

  def show
    @job = Job.find(params[:id])
    render json: @job
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render json: @job, status: :created
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    job = Job.find(params[:id])

    # Check if job is already in deleted_jobs
    existing_deleted_job = DeletedJob.find_by(title: job.title, location: job.location, description: job.description)

    unless existing_deleted_job
      deleted_job = DeletedJob.create!(
        title: job.title,
        location: job.location,
        description: job.description,
        job_type: job.job_type,
        status: job.status,
        image: job.image
      )

      # Move resumes to deleted_job
      job.resumes.update_all(deleted_job_id: deleted_job.id, job_id: nil)
    end

    job.destroy
    render json: { message: "Job deleted and archived successfully" }, status: :ok
  end

  private

  def job_params
    params.require(:job).permit(:title, :status, :description, :image, :location, :job_type)
  end
end
