class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create!(user: current_user, body: params[:text])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    @comment.destroy
    redirect_to post_path(@post)
  end

end
