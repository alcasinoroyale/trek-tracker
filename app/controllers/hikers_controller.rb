class HikersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @hiker = Hiker.new
  end

  def create
    @hiker = Hiker.new(hiker_params)

    if @hiker.save
      session[:hiker_id] = @hiker.id
      redirect_to hiker_path(@hiker)
    else
      render 'hikers/new'
    end
  end


  def show
    @hiker = Hiker.find_by(id: params[:id])
    if @hiker.id != current_user.id
      redirect_to root_path
    end
  end

  private

  def hiker_params
    params.require(:hiker).permit(:username, :hometown, :password)
  end
end
