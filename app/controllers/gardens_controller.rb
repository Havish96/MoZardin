class GardensController < ApplicationController

  def index
    @gardens = Garden.all
  end
  def new
    @garden = Garden.new
  end
   def create
 @garden = Garden.new(garden_params)

    if @garden.save
      redirect_to plant_path(@plant)
    else
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  def show
    @garden = Garden.find(params[:id])
    # @garden_plants =
end
end
