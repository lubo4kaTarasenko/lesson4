class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @task = Task.new
    @tasks = Task.all
    render 'welcome/index'
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to :root  
  end

  def destroy
    Task.delete(params[:id])
    redirect_to :root
  end 

  private

  def task_params
    params.require(:task).permit(:title, :status, :is_done, :description, :expire_at)
  end
end
