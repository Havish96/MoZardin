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
    weather = TasksController.weather_today(user)
    if user.lists.count.zero?
      list = List.create!(name: user.nickname, user_id: user.id)
    else
      list = List.find_by(user_id: user.id)
    end

    user.gardens.each do |garden|
      garden.plants.each do |plant|
        if Task.find_by(plant_id: plant.id).present?
          if ((Time.now - Task.find_by(plant_id: plant.id).created_at) / 3600) > 24
            if weather['current']['precip_mm'] < 40 && Condition.find_by(plant_id: plant.id).water == 'Regular'
              new_task = Task.new(name: plant.name, description: 'Please water your plant [NO RAIN IN YOUR AREA TODAY]',
                                  done: false,
                                  plant_id: plant.id,
                                  list_id: list.id)
            else
              new_task = Task.new(name: plant.name,
                                  description: "Precipation amount: #{weather['current']['precip_mm']} mm. " \
                                               "No need to water your plant.",
                                  done: false,
                                  plant_id: plant.id,
                                  list_id: list.id)
            end
            new_task.save
          end
        else
          if weather['current']['precip_mm'] < 30 && Condition.find_by(plant_id: plant.id).water == 'Aquatic'
            new_task = Task.new(name: plant.name, description: 'Maintain water level below the plant\'s flower',
                                done: false,
                                plant_id: plant.id,
                                list_id: list.id)
          elsif weather['current']['precip_mm'] < 30 && Condition.find_by(plant_id: plant.id).water == ('Regular' || 'Moderate')
            new_task = Task.new(name: plant.name, description: 'Please water your plant [NO RAIN IN YOUR AREA TODAY]',
                                done: false,
                                plant_id: plant.id,
                                list_id: list.id)
          elsif weather['current']['precip_mm'] > 30 && Condition.find_by(plant_id: plant.id).water == ('Regular' || 'Moderate')
            new_task = Task.new(name: plant.name,
                                description: "Precipation amount: #{weather['current']['precip_mm']} mm. " \
                                             "No need to water your plant.",
                                done: false,
                                plant_id: plant.id,
                                list_id: list.id)
          end
          new_task.save
        end
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:comment)
  end
end
