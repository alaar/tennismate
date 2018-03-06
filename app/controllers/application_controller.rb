class ApplicationController < ActionController::Base
<<<<<<< HEAD
#   protect_from_forgery with: :exception
#   before_action :authenticate_user!
#   include Pundit
=======
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :configure_permitted_paramaters, if: :devise_controller?

  def configure_permitted_paramaters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :skill_level, :age, :gender])

    devise_parameter_sanitizer.permit(:account_update, keys: [:username])

  end

  before_action :authenticate_user!
  include Pundit
>>>>>>> 0a611823654cc63500cfbcba78d6454d7cc937dd

# # Pundit: white-list approach.
#   after_action :verify_authorized, except: :index, unless: :skip_pundit?
#   after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

<<<<<<< HEAD



#   private
=======
  private
>>>>>>> 0a611823654cc63500cfbcba78d6454d7cc937dd

#   def skip_pundit?
#     devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
#   end

end
