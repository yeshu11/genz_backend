class HealthController < ApplicationController
  def index
    render plain: "ok", status: :ok
  end
end