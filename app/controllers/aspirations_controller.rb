class AspirationsController < ApplicationController
  def index
    @aspirations = current_user.aspirations
  end

  def new
    @aspiration = Aspiration.new
  end

  def create
    @aspiration = Aspiration.new(aspiration_params)

    if @aspiration.save
      redirect_to hiker_aspirations_path(current_user)
    else
      render 'aspirations/new'
    end
  end

  def update
    @aspiration = Aspiration.find_by(id: params[:id])
    @aspiration.change_status
    @aspiration.save
    redirect_to hiker_aspirations_path(current_user)
  end

  private

  def aspiration_params
    params.require(:aspiration).permit(:hiker_id, :trail_id, trail_attributes: [:name, :location])
  end
end
