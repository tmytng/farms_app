class PostsController < ApplicationController
  before_action :set_project

  def index
    # @posts = Post.all
    @posts = Post.where(project_id: @project.id)
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = '新規登録が完了しました'
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:company_name, :company_address, :company_url, :prefecture_id, :contact_person, :contact_reason,:phone_number, :email, :leadstatus_id, :purchase_date, :product_id, :contact_des, :add_file, :project_id).merge(user_id: current_user.id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
