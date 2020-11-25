class ProjectsController < ApplicationController
  before_action :set_project, only: [:update, :edit, :show, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, success: '新規プロジェクトを作成しました'
    else
      render :new, warning: '入力内容を確認してください'
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_posts_path(@project), success: 'プロジェクト情報を更新しました'
    else
      render :edit, warning: '入力内容を確認してください'
    end
  end

  def edit
  end

  def destroy
    if @project.destroy!
      redirect_to root_path, success: "削除が完了しました"
    else
      redirect_to root_path, warning: "削除が失敗しました"
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

  def project_params
    params.require(:project).permit(:name, :profile, :prj_image, user_ids: []).merge(creator: current_user.name)
  end
end
