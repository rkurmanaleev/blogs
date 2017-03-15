class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: %i(edit update)

  expose(:post)

  def index
    @posts = current_user.posts.order(created_at: :desc).limit(10)
  end

  def new
    post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user = current_user
    if post.save
      redirect_to posts_path, notice: "Post has been successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if post.update(post_params)
      redirect_to posts_path, notice: "Post has been successfully updated."
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def authorize_user!
    authorize(post, :manage?)
  end
end
