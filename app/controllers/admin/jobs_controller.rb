class Admin::JobsController < ApplicationController
  before_action :set_job, only: [:update, :destroy, :show]
  # before_action :authenticate_admin!

  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job, status: :created
    else
      render json: { errors: @job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      render json: @job, status: :ok
    else
      render json: { errors: @job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @job.destroy
      render json: { message: "Job deleted successfully" }, status: :ok
    else
      render json: { error: "Failed to delete job" }, status: :unprocessable_entity
    end
  end

  def show
    render json: @job
  end

  private

  def set_job
    @job = Job.find_by(id: params[:id])
    return render json: { error: "Job not found" }, status: :not_found unless @job
  end

  def job_params
    params.require(:job).permit(:title, :description, :location, :job_type, :status, :company_name, :salary, :job_image)
  end
end
