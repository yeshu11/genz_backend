class ApplicationController < ActionController::API
  def healthcheck
    render json: { status: 'OK' }
  end
end
