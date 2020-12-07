class Api::V1::ProjectsController < ApiController
  # 拾えなかったExceptionが発生したら500 Internal server errorを応答する
  rescue_from Exception, with: :render_status_500

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    @projects = Project.all
    # @projects.order('created_at DESC')
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render :index, status: :created
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # def set_project
  #   @project = Project.find(params[:id])
  # end
  def render_status_404(exception)
    render json: { errors: [exception] }, status: 404
  end

  def render_status_500(exception)
    render json: { errors: [exception] }, status: 500
  end

  def project_params
    params.require(:project).permit(:name, :profile, :prj_image, user_ids: []).merge(creator: current_user.name)
  end
end
