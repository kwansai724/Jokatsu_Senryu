class ApiController < ApplicationController
  def health_check
    render json: { status: 200 }
  end
end
