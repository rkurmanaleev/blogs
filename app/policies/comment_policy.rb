class CommentPolicy < ApplicationPolicy
  def delete?
    @record.user == @user
  end
end
