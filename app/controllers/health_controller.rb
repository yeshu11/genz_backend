class HealthController < ApplicationController
  def index
    render plain: "OK", status: :OK
  end
end