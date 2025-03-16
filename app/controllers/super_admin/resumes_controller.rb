class SuperAdmin::ResumesController < ApplicationController
  def index
    @resumes = Resume.all
    render json: @resumes
  end
end
