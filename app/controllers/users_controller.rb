class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to root_path, flash: { success: 'Пользователь обновлен' }
    else
      flash.now[:warning] = 'Ошибка'
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login @user
      redirect_to root_path, flash: { success: 'User was successfully created' }
    else
      render new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :locale)
  end
end
