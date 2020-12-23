# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[update edit show destroy]

  def index
    @projects = Project.all
    # @audits = Audit.all
    # @last_log = Audit.where(associated_id: @project.id).last
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = '新規プロジェクトを作成しました'
      redirect_to projects_path
    else
      flash[:warning] = '入力内容を確認してください'
      render :new
    end
  end

  def update
    if @project.update(project_params)
      flash[:success] = 'プロジェクト情報を更新しました'
      redirect_to projects_path
    else
      flash[:warning] = '入力内容を確認してください'
      render :edit
    end
  end

  def edit; end

  def destroy
    if @project.destroy
      flash[:success] = 'プロジェクトを削除しました'
      redirect_to projects_path
    else
      flash[:danger] = 'プロジェクトの削除に失敗しました'
      redirect_to root_path

    end
  end

  def show
    @message = Message.new
    @messages = @project.messages.includes(:user)
    @user_create = current_user.created_at
  end

  def search
    @projects = Project.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
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
