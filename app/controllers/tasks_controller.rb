require 'open-uri'
require 'json'

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

  def self.weather_today(user)
    url = "http://api.weatherapi.com/v1/current.json?key=bb8ae13d2adc43af89651804231303&q=#{user.city},Mauritius"
    user_serialized = URI.open(url).read
    JSON.parse(user_serialized)
  end

  def self.generate_tasks(user)
    puts weather_today(user)
    if user.lists.count.zero?
      list = List.create!(name: user.nickname, user_id: user.id)
    else
      list = List.find_by(user_id: user.id)
    end

    user.gardens.each do |garden|
      garden.plants do |plant|
        new_task = Task.new(name: plant.name, description: 'Please water your plant [NO RAIN TODAY]', done: false,
                            plant_id: plant.id,
                            list_id: list.id)
        new_task.save
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:comment)
  end
end
