class PostPolicy < ApplicationPolicy
  def initialize(user, post)
    @user = user
    @post = post
  end

  def manage?
    @post.user == @user
  end
end
