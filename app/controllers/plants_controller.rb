class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index show]

  def home
  end

  def show
    @plant = Plant.find(params[:id])
  end
end
