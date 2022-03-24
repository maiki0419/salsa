class PostsController < ApplicationController
before_action :authenticate_customer!, except: [:index]
before_action :not_team, only: [:new]
before_action :correct_customer, only: [:edit, :update]


  def new
    @post = Post.new
    @teams = current_customer.team_customers
  end

  def create
    @post = current_customer.posts.new(post_params)
    tag_list = params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      flash[:notice] = "投稿に成功しました。"
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "投稿に失敗しました。"
       @teams = current_customer.team_customers
      render :new
    end
  end

  def index
    if params[:sort] == "favorite"
      posts = Post.all.sort{ |a,b| b.favorite_customers.size <=> a.favorite_customers.size }
      @posts = Kaminari.paginate_array(posts).page(params[:page]).per(10)
    elsif params[:sort] == "follow"
      @follow = current_customer.followers
      @posts = Post.where(customer_id: @follow).page(params[:page]).per(10)
    elsif params[:sort] == "tag"
      tag = Tag.find_by(name: "#{params[:tag]}")
      @posts = tag.posts.page(params[:page]).per(10)
    else
      @posts = Post.all.order(created_at: "DESC").page(params[:page]).per(10)
    end
  end


  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
    @post_comment = PostComment.new
    @post_comments = @post.post_comments
  end

  def edit
    @post = Post.find(params[:id])
    @post_tags = @post.tags.pluck(:name).join(',')
    @teams = current_customer.team_customers
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
      @post.save_tag(tag_list)
      flash[:notice] = "更新に成功しました。"
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "更新に失敗しました。"
      @teams = current_customer.team_customers
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

  def not_team
    if current_customer.team_customers.blank?
      redirect_to new_team_path
    end
  end

  def correct_customer
    @post = Post.find(params[:id])
    if @post.customer.id != current_customer.id
      redirect_to post_path(@post.id)
    end

  end


end
