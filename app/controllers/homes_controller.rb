class HomesController < ApplicationController


  def top
    @posts = Post.all.order(created_at: "DESC").page(params[:page]).per(3)
    @tags = Tag.all.select{ |tag| tag.posts.count != 0 }
  end

  def about

  end


end
