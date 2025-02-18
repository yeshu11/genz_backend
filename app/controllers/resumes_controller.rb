class ResumesController < ApplicationController
  def index
    @resumes = Resume.where(job_id: params[:job_id])
    render json: @resumes
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      render json: @resume, status: :created
    else
      render json: @resume.errors, status: :unprocessable_entity
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:name, :email, :role, :resume_file, :job_id)
  end
end
