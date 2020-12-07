class ApplicationController < ActionController::Base
    # before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :update_sanitized_params, if: :devise_controller?

    protected
       def update_sanitized_params
         devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
         devise_parameter_sanitizer.permit(
           :account_update, keys: [:username, :email, :password, :occupation, :age, :school])
       end

      #  def configure_permitted_parameters
      #   devise_parameter_sanitizer.for(:sign_up) do |u|
      #     u.permit(user_attributes: [:username, :email, :user_id])
      #   end
      # end
end
