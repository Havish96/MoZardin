class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index show]

  def home
  end

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
    @plants = Plant.where(category: @plant.category)
  end
end
