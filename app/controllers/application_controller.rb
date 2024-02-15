class ApplicationController < ActionController::Base
  before_action :set_current_user
  helper_method :current_user, :user_signed_in?

  private 

  def set_current_user
    Current.user = authenticate_user_from_session
  end

  def authenticate_user!
    return if user_signed_in?

    store_location_for_redirect
    redirect_to login_path, alert: "You must be logged in to do that."
  end

  def store_location_for_redirect
    session[:user_return_to] = request.fullpath if request.get?
  end
  
  def current_user
    Current.user ||= authenticate_user_from_session
  end
  helper_method :current_user

  def authenticate_user_from_session
    User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end

  def login(user)
    # Store the intended redirect path before resetting the session
    redirect_path = session[:user_return_to]
    
    # Reset the session to prevent session fixation attacks
    reset_session
    
    # Set up the new session for the logged-in user
    session[:user_id] = user.id
    Current.user = user
    
    # Return path for redirection
    redirect_path || root_path
  end
  

  def logout
    Current.user = nil 
    reset_session
  end
end
