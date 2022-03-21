class HomesController < ApplicationController


  def top
    @posts = Post.all.order(created_at: "DESC").page(params[:page]).per(3)
    @tags = Tag.all
  end

  def about

  end


end
