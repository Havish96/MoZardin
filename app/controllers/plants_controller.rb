class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index show]

  def home
  end

  def index
    if params[:id].present? || params[:query].present?
      @plants = Plant.search_by_name(params[:id] || params[:query])
    else
      @plants = Plant.all
    end
  end

  def show
    @plant = Plant.find(params[:id])
    @condition = Condition.find_by(plant: @plant)
    @plants = Plant.where(category_id: @plant.category_id)
    @tag = Tag.new
  end
end
