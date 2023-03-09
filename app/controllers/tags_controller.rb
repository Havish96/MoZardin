class TagsController < ApplicationController
  def create
    @user = current_user
    @tag = Tag.new(params_tag)
    @tag.user = @user
    @plant = Plant.find(params[:plant_id])
    @tag.plant = @plant
    if @plant.save
      redirect_to tags_path
    else
      redirect_to plant_path(@plant), status: :unprocessable_entity
    end
  end

  private

  def params_tag
    params.require(:tag).permit(:age, :garden_id, :location)
  end
end
