class AdminSuper::AdminSuperSessionsController < ApplicationController
  respond_to :json  # ✅ Ensures JSON responses

  def create
    admin_super = AdminSuper.find_by(email: params[:email])

    if admin_super && admin_super.valid_password?(params[:password])
      sign_in(admin_super) # ✅ Devise sign-in method

      render json: {
        message: "Logged in successfully",
        redirect_to: "/super_admin", # ✅ Redirects to Super Admin Panel
        admin_super: {
          id: admin_super.id,
          email: admin_super.email
        }
      }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    session[:admin_super_id] = nil # ✅ Clears session on logout
    render json: { message: "Logged out successfully" }, status: :ok
  end
end
