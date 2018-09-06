class SessionsController < ApplicationController
  def new
    #user visits log in page
  end

  def create
    @hiker = Hiker.find_by(username: params[:username])
    if !!@hiker.authenticate(params[:password])
      session[:hiker_id] = @hiker.id
      raise @hiker.inspect
      redirect_to hiker_path(@hiker)
    else
      redirect_to login_path
    end
  end

end
