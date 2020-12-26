# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_project

  def index
    @message = Message.new
    @messages = @project.messages.includes(:user)
    redirect_to project_path(@project)
  end

  def create
    @message = @project.messages.new(message_params)
    if @message.save
      redirect_to project_messages_path(@project), notice: 'メッセージが送信されました'
    else
      @messages = @project.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
