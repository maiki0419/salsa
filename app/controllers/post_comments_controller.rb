class PostCommentsController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments
    @post_comment = current_customer.post_comments.new(post_comment_params)
    @post_comment.post_id = params[:post_id]
    if @post_comment.save
      flash[:notice] = "コメントを送信しました。"

    else
      flash[:alert] = "コメントの送信に失敗しました。"

    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments
    @post_comment = current_customer.post_comments.find_by(post_id: params[:post_id])
    @post_comment.destroy

  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
