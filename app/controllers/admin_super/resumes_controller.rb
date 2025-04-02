class AdminSuper::ResumesController < ApplicationController
  include Rails.application.routes.url_helpers

  def create
    @job = Job.find(params[:job_id])
    @resume = @job.resumes.new(resume_params)

    if params[:resume_file].present?
      @resume.resume_file.attach(params[:resume_file])
    end

    if @resume.save
      render json: {
        id: @resume.id,
        name: @resume.name,
        email: @resume.email,
        resume_url: @resume.resume_file.attached? ? rails_blob_url(@resume.resume_file, disposition: "inline") : nil
      }, status: :created
    else
      render json: @resume.errors, status: :unprocessable_entity
    end
  end

  def index
    resumes = Resume.includes(:job)
                    .where.not(job_id: nil)  # Exclude resumes where job_id is NULL (deleted jobs)
                    .map do |resume|
      {
        id: resume.id,
        name: resume.name,
        email: resume.email,
        job_title: resume.job.title,
        resume_url: resume.resume_file.attached? ? rails_blob_url(resume.resume_file, disposition: "inline") : nil
      }
    end

    render json: resumes
  end



  private

  def resume_params
    params.permit(:name, :email, :resume_file, :job_id)
  end
end
