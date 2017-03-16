class UsersController < ApplicationController
  before_action :authenticate_user!

  expose(:user)
  expose(:posts) { posts_fetcher }

  private

  def posts_fetcher
    user.posts.ordered_by_desc.latest
  end
end
