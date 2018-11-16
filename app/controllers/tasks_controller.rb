class TasksController < ApplicationController
  before_action :require_user


  def index
    @task = Task.new
    @tasks = current_user.tasks.q(params[:q]).s(params[:s]).order(id: :desc).paginate(:page => params[:page], :per_page => 10)
   puts @tasks.count
  end

  def create
    @task = current_user.tasks.create(task_params)
    return if @task.invalid?
    @task.save
    redirect_to :root
  end

  def update
    task.update(task_params)
    head 200
  end

  def destroy
    Task.delete(params[:id])
    redirect_to :root
  end

  private

  def task
    @task ||= current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :status, :is_done, :description, :expire_at )
  end
end
