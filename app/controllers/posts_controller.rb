class PostsController < ApplicationController


  def new
    @post = Post.new
    @teams = current_customer.team_customers
  end

  def create
    @post = current_customer.posts.new(post_params)
    if @post.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @posts = Post.all
  end


  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:team_id, :post_categroy, :title, :body, :start_date, :deadline, :prefecture_id, :city, :capacity, :place)
  end


end
