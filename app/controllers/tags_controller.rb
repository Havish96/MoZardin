class TagsController < ApplicationController
  def create
    @tag = Tag.new(params_tag)
    if @tag.save
      redirect_to garden_path(params_tag[:garden_id])
    else
      redirect_to plant_path(params_tag[:plant_id]), status: :unprocessable_entity
    end
  end

  private

  def params_tag
    params.require(:tag).permit(:age, :garden_id, :location, :plant_id)
  end
end
