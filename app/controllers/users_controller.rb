class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
