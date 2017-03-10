class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.last(10)
  end
end
