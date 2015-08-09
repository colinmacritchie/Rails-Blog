class PostsController < ApplicationController

  #index for to display all posts by time they were created at.
  def index
    @posts = Post.all.order('created_at DESC')
  end

  #Method for creating a new post.
  def new
    @post = Post.new
  end

  #Method for further creation of a new post.
  def create
    @post = Post.new(post_params)

    if @post.save

    redirect_to @post

    else

      render 'new'

    end
  end

  #Method for displaying the post in the view file /posts/show.html.erb.
  def show

    @post = Post.find(params[:id])

  end

  #Method for editing an existing Post.
  def edit
    @post = Post.find(params[:id])
  end

  #Method for updating and exsisting post that has been edited.
  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render 'edit'
    end

  end

  #Method to Delete a post.
  def destroy

    @post = Post.find(params[:id])

    @post.destroy

    redirect_to posts_path

  end

  #Begin of rails 4 private method creation.

  private

  def post_params

    params.require(:post).permit(:title, :body)

  end

end