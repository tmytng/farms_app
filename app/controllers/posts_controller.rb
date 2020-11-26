class PostsController < ApplicationController
  before_action :set_project
  before_action :set_post, only: [:edit, :show, :update, :destroy]

  def index
    @posts = Post.where(project_id: @project.id)
    # @audit =

    respond_to do |format|
      format.html
      format.csv { send_data @posts.generate_csv, filename: "posts-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def new
    @post = Post.new
  end

  def show
    @logs = @post.audits.all
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to project_posts_path, notice: '登録情報を修正しました'
    else
      render :edit, notice: '登録情報が修正できません'
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

  def import
    current_user.posts.import(params[:file])
    redirect_to project_posts_path, notice: "投稿履歴を追加しました"
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
