class StockersController < ApplicationController
  def create
    @stocker = current_user.stockers.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @stocker = current_user.stockers.find_by(post_id: @post.id)
    @stocker.destroy
    redirect_back(fallback_location: root_path)
  end
end
