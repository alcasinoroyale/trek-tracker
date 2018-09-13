class SessionsController < ApplicationController
  skip_before_action :require_login

  def new

  end

  def create
    if !!auth
      @hiker = Hiker.find_or_create_by(username: auth.name)
      # User is not valid without a HOMETOWN so I can't create just from Google.
      # Two ideas: Redirect to sign in. OR I can just allow a user to validate
      # WITHOUT a hometown. Then have an "Update Hometown" link LATER on the
      # hiker#show page.
      raise @hiker.inspect
      @hiker.save
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
    request.env['omniauth.auth'].info
  end
end
