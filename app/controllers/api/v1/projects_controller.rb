class Api::V1::ProjectsController < ApiController
  before_action :set_project

  def index
    @projects = Project.all
    # @projects.order('created_at DESC')
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render :index, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :profile, :prj_image, user_ids: []).merge(creator: current_user.name)
  end
end

end
