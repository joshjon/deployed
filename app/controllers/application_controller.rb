class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # used to determine current user for submission
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    current_user.nil? ? false : true
  end

  helper_method :current_user, :logged_in?

  #  redirects if user tries to access a page they are not allowed to
  def prevent_unauthorized_user_access
    redirect_to login_path, notice: 'Please login to access this page', status: :found unless logged_in?
  end

  def prevent_logged_in_user_access
    redirect_to root_path, notice: 'Sorry, you cannot access that page', status: :found if logged_in?
  end
end
