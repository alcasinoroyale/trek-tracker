class AspirationsController < ApplicationController
  def index
    # params[:hiker_id] is the Hiker.id
    @aspirations = Hiker.find_by(id: params[:hiker_id]).trails
  end

  def new
    # params[:hiker_id] is the Hiker.id
    @aspiration = Aspiration.new
  end

  def create
    # logic to add a trail to this hiker's aspirations
    @aspiration = Aspiration.new(aspiration_params)
    if @aspiration.save
      redirect_to hiker_aspirations_path(current_user)
    else
      render new_hiker_aspiration_path
    end
  end

  private

  def aspiration_params
    params.require(:aspiration).permit(:hiker_id, :trail_id)
  end
end
