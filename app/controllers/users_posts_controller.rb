class UsersPostsController < ApplicationController
  expose(:user)
  expose_decorated(:posts) { fetch_posts }

  def index
  end

  private

  def fetch_posts
    user.posts.ordered_by_desc.page(params[:page])
  end
end
