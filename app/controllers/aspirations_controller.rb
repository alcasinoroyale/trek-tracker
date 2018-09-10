class AspirationsController < ApplicationController
  def index
    @aspirations = Hiker.find_by(id: params[:hiker_id]).trails
  end

  def new
    @aspiration = Aspiration.new
  end

  def create
    raise params.inspect
    # This controller must handle a new aspiration for an
    # existing trail selected, OR a new trail the user creates.
    # The New Trail will post to #create, handled by Aspirations

    @aspiration = Aspiration.new(aspiration_params)
    if @aspiration.save
      redirect_to hiker_aspirations_path(current_user)
    else
      # FIXME: the URL is the hiker_aspirations index path
      render 'aspirations/new'
    end
  end

  private

  def aspiration_params
    params.require(:aspiration).permit(:hiker_id, :trail_id)
  end
end
