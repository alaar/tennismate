class ApplicationController < ActionController::Base
#   protect_from_forgery with: :exception
#   before_action :authenticate_user!
#   include Pundit
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :configure_permitted_paramaters, if: :devise_controller?

  def configure_permitted_paramaters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :skill_level, :age, :gender, :radius])

    devise_parameter_sanitizer.permit(:account_update, keys: [:username])

  end

  before_action :authenticate_user!
  include Pundit

# # Pundit: white-list approach.
#   after_action :verify_authorized, except: :index, unless: :skip_pundit?
#   after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?




#   private
  private

#   def skip_pundit?
#     devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
#   end

end
