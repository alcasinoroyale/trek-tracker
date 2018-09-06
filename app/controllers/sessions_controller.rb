class SessionsController < ApplicationController
  def new
    #user visits log in page
  end

  def create
    @hiker = Hiker.find_by(username: params[:username]).try(:authenticate, params[:password])
    if !!@hiker
      session[:hiker_id] = @hiker.id
      redirect_to hiker_path(@hiker)
    else
      redirect_to login_path
    end
  end

end
