class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @task = Task.new
    @tasks = Task.all.order(id: :desc)
  end
end
