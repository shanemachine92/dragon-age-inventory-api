class UsersController < ApplicationController

 skip_before_action :authenticate_request!

  def create
    @user = User.create!(user_params)
  end
  
  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
