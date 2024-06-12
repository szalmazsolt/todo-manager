class ApplicationController < ActionController::Base

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def logged_in?
    !!current_user
  end

  helper_method :logged_in?

  def same_user?(user)
    current_user == user
  end

  helper_method :same_user?

end
