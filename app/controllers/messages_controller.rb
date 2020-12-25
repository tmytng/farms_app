# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_project
  before_action :set_message, only: %i[edit update destroy]

  def create
    @message = @project.messages.new(message_params)
    if @project.save
      flash[:notice] = 'メッセージボードに投稿しました'
      # redirect_to project_path(@project)
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = '投稿できませんでした。投稿内容を確認してください。'
      redirect_back(fallback_location: root_path)

    end
  end

  def edit; end

  def update
    if @message.update(message_params)
      flash[:notice] = 'メッセージボードに投稿しました'
      redirect_to project_path(@project)
    else
      flash[:error] = '投稿できませんでした。投稿内容を確認してください。'
      @project = Project.find(params[:project_id])
      render :edit
    end
  end

  def destroy
    if @message.destroy
      flash[:notice] = '削除が完了しました'
      redirect_to project_path(@project)
    else
      flash[:error] = '削除に失敗しました'
      render :destroy
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :content).merge(user_id: current_user.id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
