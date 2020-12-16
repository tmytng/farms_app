class PostsController < ApplicationController
  before_action :set_project
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_logs, only: [:show, :edit]

  def index
    @posts = Post.where(project_id: @project.id)
    respond_to do |format|
      format.html
      format.csv { send_data @posts.generate_csv, filename: "posts-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
    @q = Post.ransack(params[:q])
    @results = @q.result.includes(:user)
  end

  def search
    @q = Post.search(search_params)
    @results = @q.result.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      flash[:notice] = "#{@post.company_name}様の新規登録が完了しました"
      redirect_to project_posts_path(@project)
    else
      flash.now[:notice] =  "登録内容に誤りがあります"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to project_post_path, notice: "#{@post.company_name}様の登録情報を修正しました"
    else
      flash.now[:notice] =  "修正内容に誤りがあります"
      render :new
    end
  end

  def show
  end

  def destroy
    if @post.destroy!
      redirect_to  project_posts_path, notice: "[INFO ID:#{@post.id}]の削除が完了しました"
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

  def search_params
    params.require(:q).permit!
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_logs
    @logs = @post.audits.all
  end


end
