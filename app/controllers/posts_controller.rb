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
    # if @post.save
    #   flas
  end
end
