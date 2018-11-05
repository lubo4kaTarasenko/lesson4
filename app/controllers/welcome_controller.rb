class WelcomeController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all.order(id: :desc)
  end
end
