class ListsController < ApplicationController
  def index
    @list = List.all.where(user: current_user)
    @tasks = Task.where(list: @list).reverse
    @task = Task.new
    @task_done = Task.where(list: @list, done: true)
  end
end
