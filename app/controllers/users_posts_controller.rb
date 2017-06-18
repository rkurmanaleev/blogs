class UsersPostsController < ApplicationController
  expose(:user)
  expose_decorated(:posts) { user.posts.ordered_by_desc.page(params[:page]) }

  def index
  end
end
