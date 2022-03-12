class HomesController < ApplicationController


  def top
    @posts = Post.all.order(created_at: "DESC")
  end

  def about

  end


end
