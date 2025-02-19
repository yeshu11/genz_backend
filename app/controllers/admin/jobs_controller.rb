class Admin::JobsController < ApplicationController
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
      render json: @job, status: :ok
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    render json: { message: "Job deleted successfully" }, status: :ok
  end

  def show
    @job = Job.find(params[:id])
    render json: @job
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :location, :job_type, :status)
  end
end
