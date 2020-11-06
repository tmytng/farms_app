class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @projects = Project.all
  end

  def create
    user = User.create!(user_params)
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :email, :profile, :position)
  end

end
