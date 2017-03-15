class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: %i(edit update)

  expose_decorated(:post)
  expose_decorated(:posts) { posts_fetcher }

  def create
    post.user = current_user
    if post.save
      redirect_to posts_path, notice: "Post has been successfully created."
    else
      render :new
    end
  end

  def update
    if post.update(post_params)
      redirect_to posts_path, notice: "Post has been successfully updated."
    else
      render :edit
    end
  end

  private

  def posts_fetcher
    current_user.posts.ordered_by_desc.latest
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def authorize_user!
    authorize(post, :manage?)
  end
end
