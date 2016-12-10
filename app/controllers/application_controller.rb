class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def run_of_the_mill_authentication
    if current_user.nil?
      flash[:errors] = "You must sign in first!"
      redirect_to new_user_session_path
    end
  end
end
