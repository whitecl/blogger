class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post_id = params[:post_id]
    @comment.author = current_user

    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      render 'posts/show'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:post_id])
  end
end
