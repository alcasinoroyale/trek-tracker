class HikerController < ApplicationController
  def new
    @hiker = Hiker.new
  end

  def create
    raise params.inspect
  end
end
