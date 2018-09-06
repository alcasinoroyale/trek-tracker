class ApplicationController < ActionController::Base
  before_action :require_login
  skip_before_action :require_login, only: [:welcome]



  def welcome

  end

  private

  def logged_in?
    !!session[:hiker_id]
  end

  def require_login
    unless logged_in?
      flash[:message] = "You must be logged in to access this page"
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= Hiker.find(session[:hiker_id]) if session[:hiker_id]
  end

end
