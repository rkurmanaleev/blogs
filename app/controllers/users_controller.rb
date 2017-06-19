class UsersController < ApplicationController
  before_action :authenticate_user!
  expose_decorated(:user)
  expose_decorated(:users) { fetch_users }

  def index
  end

  def show
  end

  private

  def fetch_users
    User.with_posts.order_by_posts
  end
end
