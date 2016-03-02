class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login, :set_locale

  private
  def not_authenticated
    redirect_to login_path
  end

  def set_locale
    if current_user
      I18n.locale = current_user.locale || I18n.default_locale
    else
      I18n.locale = params[:locale] || I18n.default_locale
    end
  end
end
