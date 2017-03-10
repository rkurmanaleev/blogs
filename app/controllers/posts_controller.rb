class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.order(created_at: :desc).last(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: "Post has been successfully created."
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
