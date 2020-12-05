class UsersController < ApplicationController
  after_action :after_login, only: [:create]

  def index
    @users = User.all
    # @q = User.ransack(params[:q])
    # @users = @q.result(distinct: true)

  end

  def new
    @projects = Project.all
  end

  def create
    # @user = User.create!(user_params)
    # redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  # def test
  # end

  def update
    @user = User.find(params[:id])
    if current_user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy!
      redirect_to users_path, notice: "削除が完了しました"
    else
      render :edit, alert: "削除が失敗しました"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :profile, :position)
  end

  def after_login
    current_user.update(first_sign_in_at: current_user.current_sign_in_at) unless current_user.first_sign_in_at
  end
end
