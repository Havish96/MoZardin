class TasksController < ApplicationController
  def update
    @task = Task.find(params[:id])
    @task.done = true

    if @task.update(task_params)
      flash[:success] = "You completed this task 😁"
      redirect_to lists_path
    else
      flash.now[:error] = "Failed to save changes 😕"
      redirect_to lists_path, status: :unprocessable_entity
    end
  end

  def weather_today
    url = "http://api.weatherapi.com/v1/current.json?key=bb8ae13d2adc43af89651804231303&q=#{current_user.city},Mauritius"
    user_serialized = URI.open(url).read
    JSON.parse(user_serialized)
  end

  private

  def task_params
    params.require(:task).permit(:comment)
  end
end
