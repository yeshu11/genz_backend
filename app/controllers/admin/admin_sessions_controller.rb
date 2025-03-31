class Admin::AdminSessionsController < ApplicationController
  respond_to :json
  
  def create
    admin = Admin.find_by(email: params[:email])

    if admin && admin.valid_password?(params[:password])
      sign_in(admin)
      render json: {
        message: "Logged in successfully",
        redirect_to: "/admin",
        admin: {
          id: admin.id,
          name: admin.name,
          email: admin.email,
          phone: admin.phone
        }
      }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    session[:admin_id] = nil
    render json: { message: "Logged out successfully" }, status: :ok
  end
end
