class ListsController < ApplicationController
  def index
    @list = List.all.where(user: current_user)
    @tasks = Task.where(list: @list)
    @task = Task.new
  end
end
