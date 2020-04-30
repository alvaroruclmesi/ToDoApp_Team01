class ApplicationController < ActionController::Base


    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, only: [:update]

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)}
        devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)}
    end
end
