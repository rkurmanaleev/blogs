class PostPolicy < ApplicationPolicy
  def initialize(user, post)
    @user = user
    @post = post
  end

  def manage?
    @post.user_id == @user.id
  end
end
