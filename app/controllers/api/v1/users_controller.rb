class Api::V1::UsersController < ApiController
  # 拾えなかったExceptionが発生したら500 Internal server errorを応答する
  rescue_from Exception, with: :render_status_500

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

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
    @user = User.new(user_params)
    if @user.save
      # user.avatar = user_params[:image]
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
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
    params.require(:user).permit(:name, :email, :avatar, :profile, :position, :image, :password, :password_confirmation)
  end
end


