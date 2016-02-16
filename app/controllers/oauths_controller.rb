class OauthsController < ApplicationController
  skip_before_filter :require_login

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, flash: { success: "Logged in from #{provider.titleize}!" }
    else
      begin
        @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, flash: { success: "Logged in from #{provider.titleize}!" }
      rescue
        redirect_to root_path, flash: { warning: "Failed to login from #{provider.titleize}!" }
      end
    end
  end

  private
  def auth_params
    params.permit(:code, :provider)
  end
end
