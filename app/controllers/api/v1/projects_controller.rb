class Api::V1::ProjectsController < ApiController
  before_action :set_project, only: [:show, :update, :destroy]

  # 拾えなかったExceptionが発生したらerrorを応答する
  rescue_from Exception, with: :render_status_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    @projects = Project.all
    render json: @projects
    # @projects.order('created_at DESC')
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project, status: :created
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @project
  end

  def update
    if @project.update(project_params)
      head :no_content
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @project.destroy
      head :no_content
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def render_status_404(exception)
    render json: { errors: [exception] }, status: 404
  end

  def render_status_500(exception)
    render json: { errors: [exception] }, status: 500
  end

  def project_params
    params.require(:project).permit(:id, :image, :created_at, :updated_at, :creator,:name, :profile, :prj_image, user_ids: []).merge(creator: current_user.name)
  end
end
