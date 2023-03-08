class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def index
    @plants = Plant.all
  end
end
