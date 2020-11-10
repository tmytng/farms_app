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

  def destroy
    @user = User.find(params[:id])
    if @user.destroy!
      redirect_to root_path, notice: "削除が完了しました"
    else
      redirect_to root_path, alert: "削除が失敗しました"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :email, :profile, :position)
  end

end
