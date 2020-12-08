class Api::V1::UsersController < ApiController
  before_action :set_user, only: [:show, :update, :destroy]

  # 拾えなかったExceptionが発生したらerrorを応答する
  rescue_from Exception, with: :render_status_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      head :no_content
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      head :no_content
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def render_status_404(exception)
    render json: { errors: [exception] }, status: 404
  end

  def render_status_500(exception)
    render json: { errors: [exception] }, status: 500
  end

  def user_params
    params.require(:user).permit(:id, :name, :email, :avatar, :profile, :position, :image, :password, :password_confirmation, :created_at, :updated_at, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end


