class DestinationsController < ApplicationController

  def show
    set_destination
    
  end

  private

  def set_destination
    @destination = Destination.find(params[:id])
  end

end
