class PostsController < ApplicationController
  before_action :set_project
  before_action :set_post, only: [:edit, :show, :update, :destroy]

  def index
    # @posts = Post.all
    @posts = Post.where(project_id: @project.id)
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to project_posts_path, notice: '登録情報を修正しました'
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = '新規登録が完了しました'
      redirect_to project_posts_path(@project)
    else
      render :new
    end
  end

  def destroy
    if @post.destroy!
      redirect_to root_path, notice: "削除が完了しました"
    end
  end

  private

  def post_params
    params.require(:post).permit(:company_name, :company_address, :company_url, :prefecture_id, :contact_person, :contact_reason,:phone_number, :email, :leadstatus_id, :purchase_date, :product_id, :contact_des, :project_id, post_files:[]).merge(user_id: current_user.id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
