class ApplicationController < ActionController::Base

  def welcome

  end

  def logged_in?
    !!session[:hiker_id]
  end
end
