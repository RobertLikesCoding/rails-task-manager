class TasksController < ApplicationController
  def list
    @tasks = Task.all
  end

  def find
    @task = Task.find(params[:id])
  end

  def new
    @empty_task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to list_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to find_path(task)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to list_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
