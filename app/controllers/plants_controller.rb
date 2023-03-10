class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index show]

  def home
  end

  def index
    category = ['Fruits & Vegetables', 'Herbs', 'Trees', 'Water & Aquatic']
    if params[:query].present? && !category.include?(params[:query])
      @plants = Plant.search_by_name(params[:query])
    elsif category.include?(params[:query])
      @plants = Plant.where(category: Category.find_by(name: params[:query]))
    else
    @plants = Plant.all
    end
  end

  def show
    @plant = Plant.find(params[:id])
    @plants = Plant.where(category_id: @plant.category_id)
    @tag = Tag.new
  end
end
