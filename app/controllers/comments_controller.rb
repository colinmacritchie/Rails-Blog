class CommentsController < ApplicationController

  #Method to create a comment.
  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.create(params[:comment].permit(:name, :body))

    redirect_to post_path(@post)
  end

  #Method to destroy comments.
  def destroy
    @post = Post.find(params[:post_id])

    @comment = @post.comments.find(params[:id])

    @comment.destroy

    redirect_to post_path(@post)
  end
end