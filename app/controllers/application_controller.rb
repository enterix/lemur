class ApplicationController < ActionController::Base
  before_action :set_locale

  protect_from_forgery

  private
  def get_user
    User.find_by id: session[:user_id]
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end
end
