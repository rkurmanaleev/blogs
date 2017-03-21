class CommentPolicy < ApplicationPolicy
  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def delete?
    @comment.user_id == @user.id
  end
end
