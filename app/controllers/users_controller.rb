class UsersController < ApplicationController
  before_action :authenticate_user!

  expose(:user)
  expose(:posts) { user.posts.ordered_by_desc.latest }
end
