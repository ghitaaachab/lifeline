class ApplicationController < ActionController::Base


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :gender, :social_status, :phone_number, :photo, :date_of_birth])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :gender, :social_status, :phone_number, :photo, :date_of_birth])
  end
end
