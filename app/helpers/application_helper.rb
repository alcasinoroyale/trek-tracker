module ApplicationHelper
  def logged_in?
    !!session[:hiker_id]
  end
end
