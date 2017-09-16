class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user
      login(@user)
      render :show
    else
      render json: ["Wrong username or password"], status: 422
    end
  end

  def destroy
    logout
    render json: ["Logged out"]
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
