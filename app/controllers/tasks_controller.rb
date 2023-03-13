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

  private

  def task_params
    params.require(:task).permit(:comment)
  end
end
