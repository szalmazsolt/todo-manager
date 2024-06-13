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

  def require_logged_in
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end

  def require_same_user
    # fail
    if params[:user_id]
      user = User.find(params[:user_id])
    else
      user = User.find(params[:id])
    end
    unless same_user?(user)
      flash[:alert] = "You can only manage your own todos"
      redirect_to user_path(current_user)
    end
  end

end
