class MyPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: %i(edit update destroy)

  expose(:post)
  expose_decorated(:posts) { fetch_posts }

  def index
  end

  def new
  end

  def create
    post.user = current_user
    post.save

    respond_with(post)
  end

  def edit
  end

  def update
    post.update(post_params)

    respond_with(post)
  end

  def destroy
    post.destroy

    respond_with(post, location: my_posts_path)
  end

  private

  def fetch_posts
    current_user.posts.ordered_by_desc.page(params[:page])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def authorize_user!
    authorize(post, :manage?)
  end
end
