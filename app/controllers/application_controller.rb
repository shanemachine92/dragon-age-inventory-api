class ApplicationController < ActionController::Base
  include Response
  attr_reader :current_user

  protected
  def authenticate_request!
    unless auth_token
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
  rescue JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  private
  def auth_token
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end
end
