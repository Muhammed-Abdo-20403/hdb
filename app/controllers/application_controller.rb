class ApplicationController < ActionController::Base
    include Pagy::Backend
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    around_action :set_time_zone
    around_action :switch_locale

    def switch_locale(&action)
        locale = params[:locale] || I18n.default_locale
        I18n.with_locale(locale, &action)
    end
    protected

    def configure_permitted_parameters
        attributes = [:name, :phone]
        attributes_account_update = [:name, :phone, :avatar]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes_account_update)
    end

    def set_time_zone
        Time.use_zone("Cairo") { yield }
    end
end
