class JobsController < ApplicationController
  def index
    @jobs = Job.all
    render json: @jobs
  end

  def show
    @job = Job.find(params[:id])
    
    # Check if the request is coming from the admin view
    if request.path.include?("/admin")
      # For admin, only render job details without resumes
      render json: @job
    else
      # For careers, render job details and include resume submission form
      render json: @job
    end
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
    @job = Job.find(params[:id])
    @job.destroy
    render json: { message: "Job deleted successfully" }
  end

  private

  def job_params
    params.require(:job).permit(:title, :status, :description, :image)
  end
end
