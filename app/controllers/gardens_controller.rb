class GardensController < ApplicationController
  def index
    @gardens = Garden.where(user_id: current_user.id)
    @garden = Garden.new
  end

  def create
    @user = current_user
    @garden = Garden.new(garden_params)
    @garden.user = @user

    if @garden.save
      redirect_to garden_path(@garden)
    else
      redirect_to gardens_path, status: :unprocessable_entity
    end
  end

  def show
    @garden = Garden.find(params[:id])
    @tags = Tag.all.where(garden_id: @garden)
  end

  private

  def garden_params
    params.require(:garden).permit(:name)
  end
end
