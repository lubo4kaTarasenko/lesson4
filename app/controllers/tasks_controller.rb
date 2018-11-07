class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.where("title LIKE '%#{params[:q]}%'")
    render 'welcome/index'
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
  end

  def create
    @task = Task.create(task_params)
    redirect_to :root
  end

  def destroy
    Task.delete(params[:id])
    redirect_to :root
  end

 

  private

  def task_params
    params.require(:task).permit(:title, :status, :is_done)
  end
end
