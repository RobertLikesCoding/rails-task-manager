class TasksController < ApplicationController
  before_action :set_task, only: [:find, :edit, :update, :destroy]

  def list
    @tasks = Task.all
  end

  def find
  end

  def new
    @empty_task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to list_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to find_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to list_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
