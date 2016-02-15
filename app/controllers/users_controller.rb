class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to root_path, success: 'Пользователь обновлен'
    else
      render edit_user_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      auto_login @user
      redirect_to root_path, success: 'User was successfully created'
    else
      render new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
