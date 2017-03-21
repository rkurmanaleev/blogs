class CommentPolicy < ApplicationPolicy
  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def delete?
    @comment.user == @user
  end
end
