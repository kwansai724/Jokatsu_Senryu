class ApiController < ApplicationController
  def health_check
    render json: { message: 'health check ok' }
  end
end
