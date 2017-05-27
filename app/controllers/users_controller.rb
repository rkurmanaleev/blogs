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
    User.find_by_sql('SELECT * FROM users WHERE ("posts_count" > 0) ORDER BY "posts_count" DESC')
  end
end
