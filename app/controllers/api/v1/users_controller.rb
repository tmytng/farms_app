class Api::V1::UsersController < ApiController

  def index
    users = User.all
    render json: users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :profile, :position)
  end
end
