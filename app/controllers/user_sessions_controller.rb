class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:user][:email], params[:user][:password])
      redirect_back_or_to root_path, success: 'Login successful'
    else
      flash.now[:warning] = 'Login failed'
      render new_user_session_path
    end
  end

  def destroy
    logout
    redirect_to root_path, success: 'Logged out!'
  end
end
