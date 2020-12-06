class Api::V1::UsersController < ApiController

  def index
    @users = User.all
  end

  # def show
  #   @user = User.find(params[:id])
  #   render json: @user
  # end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      user.avatar = user_params[:image]
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :profile, :position, :image, :password, :password_confirmation)
  end
end


