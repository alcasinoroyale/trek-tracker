class SessionsController < ApplicationController
  skip_before_action :require_login

  def new

  end

  def create
    if !!auth
      @hiker = Hiker.find_or_create_by_omniauth(auth)
      
      session[:hiker_id] = @hiker.id
      redirect_to hiker_path(@hiker)
    else
      @hiker = Hiker.find_by(username: params[:username]).try(:authenticate, params[:password])

      if !!@hiker
        session[:hiker_id] = @hiker.id
        redirect_to hiker_path(@hiker)
      else
        flash[:message] = "Enter correct username and password, or sign up"
        render 'sessions/new'
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
