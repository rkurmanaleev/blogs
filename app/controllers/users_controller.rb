class UsersController < ApplicationController
  before_action :authenticate_user!

  expose_decorated(:user)
  expose_decorated(:posts) { posts_fetcher }

  private

  def posts_fetcher
    params[:all] ? user.posts.ordered_by_desc : user.posts.ordered_by_desc.latest
  end
end
