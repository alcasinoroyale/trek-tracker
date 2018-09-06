class SessionsController < ApplicationController
  skip_before_action :require_login

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

  def destroy
    session.clear
    redirect_to root_path
  end

end
