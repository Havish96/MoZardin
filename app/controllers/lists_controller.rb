class ListsController < ApplicationController
  def index
    @list = List.find_by(user: current_user)
    @tasks = Task.where(list: @list)
    @task = Task.new
  end
end
