class FavoritesController < ApplicationController
before_action :authenticate_customer!
  def create
    @post = Post.find(params[:post_id])
    # お気に入り通知
    @post.create_notification_like!(current_customer)

    @favorite = current_customer.favorites.create(post_id: @post.id)



  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_customer.favorites.find_by(post_id: @post.id)
    @favorite.destroy
  end

end
