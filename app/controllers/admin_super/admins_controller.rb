class AdminSuper::AdminsController < ApplicationController
  def create
    admin = Admin.new(admin_params)
    if admin.save
      render json: { message: "Admin created successfully" }, status: :created
    else
      render json: { errors: admin.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def admin_params
    params.permit(:name, :email, :phone, :password, :password_confirmation)
  end
end
