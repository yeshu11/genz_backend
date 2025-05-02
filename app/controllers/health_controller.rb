class HealthController < ApplicationController
  # Skip authentication for this endpoint if you're using Devise or similar
  skip_before_action :authenticate_user!, raise: false if defined?(Devise)

  def index
    ActiveRecord::Base.connection.execute("SELECT 1")
    render plain: "OK", status: :ok
  rescue ActiveRecord::StatementInvalid
    render plain: "Database connection failed", status: :service_unavailable
  end
end