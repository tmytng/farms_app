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
    if @user.update(user_params) && @user.avatar.attach(params[:avatar])
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # def update
  #   if current_user.update(user_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end



  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end

  def update_params
    params.require(:user).permit(:avatar)
  end

end
