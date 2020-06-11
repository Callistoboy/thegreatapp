class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_locale

  def pages_of(data, records_per_pages)
    unless data.kind_of?(Array)
      data.page(params[:page]).per(records_per_pages)
    else
      Kaminari.paginate_array(data).page(params[:page]).per(records_per_pages)
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user


  def extr_locale_in_accept_lang
    locale = params[:locale]
  end

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale_from_params
    if params[:locale]
      extr_locale_in_accept_lang
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash.now[:alarm] = " #{params[:locale]} Перевод страницы отсутствует"
      end
      params[:locale]
    end
  end

  def set_locale
    I18n.locale = set_locale_from_params || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end
end
