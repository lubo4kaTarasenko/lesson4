class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.where("title LIKE '%#{params[:q]}%'")
    # 'welcome/index'
    render layout: 'tasks'
  end

  def create
    @task = Task.create(task_params)
    if @task.valid?
      @task.save
      redirect_to :root
    else
      redirect_to :root, notice: @task.errors.messages
    end
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.status.zero?
      @task.status = 1
    else
      @task.status = 0
    end
    @task.save
    redirect_to :root
  end

  def destroy
    Task.delete(params[:id])
    redirect_to :root
  end

  private

  def update_task_params
    params.require(:task).permit(:status)
  end
  def task_params
    params.require(:task).permit(:title, :description, :expire_at, :status)
  end
end
