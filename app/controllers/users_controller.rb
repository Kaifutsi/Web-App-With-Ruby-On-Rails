class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle successful registration, e.g., redirect to dashboard
      redirect_to dashboard_path
    else
      # Handle registration failure, e.g., show error messages
      render 'new'
    end
  end

  def profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
