class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?


    protected

    def configure_permitted_parameters
        attributes = [:name, :phone]
        attributes_account_update = [:name, :phone]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes_account_update)
    end
end
