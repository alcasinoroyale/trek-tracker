class HikersController < ApplicationController
  def new
    @hiker = Hiker.new
  end

  def create
    raise hiker_params.inspect
    @hiker = Hiker.new(hiker_params)
    if @hiker.save
      # hiker show page
    else
      redirect_to new_hiker_path
    end
  end

  private

  def hiker_params
    params.require(:hiker).permit(:username, :hometown, :password)
  end
end
