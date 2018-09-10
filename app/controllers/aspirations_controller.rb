class AspirationsController < ApplicationController
  def index
    @aspirations = Hiker.find_by(id: params[:hiker_id]).trails
  end

  def new
    @aspiration = Aspiration.new
  end

  def create

    @aspiration = Aspiration.new(aspiration_params)
    if @aspiration.save
      redirect_to hiker_aspirations_path(current_user)
    else
      # FIXME: do you need to explicitly define the url
      # and controller action in the form for in the view?
      render 'aspirations/new'
    end
  end

  private

  def aspiration_params
    params.require(:aspiration).permit(:hiker_id, :trail_id, trail_attributes: [:name, :location])
  end
end
