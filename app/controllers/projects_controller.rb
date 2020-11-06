class ProjectsController < ApplicationController
  before_action :set_project, only: [:create, :update, :show]
  before_action :set_user, only: [:index]

  def index
  end

  def new
    @project = Project.new
    # @project.users << current_user
  end

  def create
    if @project.save
      redirect_to projects_path, notice: '新規プロジェクトを作成しました'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_path, notice: 'プロジェクト情報を更新しました'
    else
      render :edit
    end
  end

  def show
    @message = Message.new
    @messages = @project.messages.includes(:user)
    @user_create = current_user.created_at

  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_user
    if user_signed_in?
      @user = current_user
    end
  end

  def project_params
    params.require(:project).permit(:name, :image, :profile, user_ids: [])
  end
end
