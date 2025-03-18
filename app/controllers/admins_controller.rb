class AdminsController < ApplicationController
  require 'bcrypt'

  def login
    admin = Admin.find_by(email: params[:email])

    if admin && BCrypt::Password.new(admin.password_digest) == params[:password]
      token = SecureRandom.hex(16) # Generate a simple session token
      render json: { token: token, message: "Login successful" }, status: :ok
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end
end
