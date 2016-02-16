class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:session][:email], params[:session][:password])
      flash[:success] = 'Login successful'
      redirect_back_or_to root_path
    else
      flash.now[:warning] = 'Login failed'
      render new_user_session_path
    end
  end

  def destroy
    logout
    redirect_to root_path, flash: { success: 'Logged out!' }
  end
end
