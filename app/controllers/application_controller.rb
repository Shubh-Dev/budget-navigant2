class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def route_not_found
      render file: 'public/404.html', status: :not_found, layout: false
    end
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name photo email])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name photo email])
    end
end
