class AspirationsController < ApplicationController
  def index
    # params[:hiker_id] is the Hiker.id
    @aspirations = Hiker.find_by(id: params[:hiker_id]).trails
  end

  def new
    # params[:hiker_id] is the Hiker.id
    @aspiration = Aspiration.new
    @trails = Trail.all
  end

  def create
    # logic to add a trail to this hiker's aspirations
    raise params.inspect
  end
end
