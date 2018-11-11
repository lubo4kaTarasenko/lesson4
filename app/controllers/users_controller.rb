class UsersController < ApplicationController
  def index
    # @user = User.new
    # render 'login'
  end

  def login
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    puts @user.valid?
    if @user.valid?
      @user.save
    else

    end
    # redirect_to :root
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
