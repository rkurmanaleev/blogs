class UsersController < ApplicationController
  before_action :authenticate_user!
  expose_decorated(:user)
  expose_decorated(:users) { users_fetcher }

  def index
  end

  def show
  end

  private

  def users_fetcher
    User.with_posts.sort_by(&:posts_count).reverse
  end
end
