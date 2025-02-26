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

    # Move job to deleted_jobs before destroying it
    deleted_job = DeletedJob.create!(
      title: job.title,
      location: job.location,
      description: job.description,
      job_type: job.job_type,
      status: job.status,
      image: job.image
    )

    # Assign deleted_job_id to resumes before deletion
    job.resumes.update_all(deleted_job_id: deleted_job.id, job_id: nil)

    job.destroy
    render json: { message: "Job deleted and archived successfully" }, status: :ok
  end

  private

  def job_params
    params.require(:job).permit(:title, :status, :description, :image)
  end
end
