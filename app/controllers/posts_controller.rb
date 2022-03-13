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
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments
  end

  def edit
    @post = Post.find(params[:id])
    @teams = current_customer.team_customers
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:team_id, :post_categroy, :title, :body, :start_date, :deadline, :prefecture_id, :city, :capacity, :place)
  end


end
