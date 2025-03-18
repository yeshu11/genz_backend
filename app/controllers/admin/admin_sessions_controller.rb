class Admin::AdminSessionsController < ApplicationController
  before_action :authorize_admin, only: [:destroy]

  def create
    admin = Admin.find_by(email: params[:email])

    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id  # ✅ Store admin ID in session
      render json: { message: "Login successful", admin: admin }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    reset_session  # ✅ Completely clears the session
    render json: { message: "Logout successful" }, status: :ok
  end

  private

  def authorize_admin
    unless session[:admin_id]
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
