class HikersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  #Sign Up Page
  def new
    @hiker = Hiker.new
  end

  def create
    @hiker = Hiker.new(hiker_params)

    if @hiker.save
      redirect_to hiker_path(@hiker)
    else
      #show errors
      redirect_to new_hiker_path
    end
  end

  #Profile Page
  def show
    @hiker = Hiker.find_by(id: params[:id])
  end

  private

  def hiker_params
    params.require(:hiker).permit(:username, :hometown, :password)
  end
end
