class CommentPolicy < ApplicationPolicy
  def delete?
    @record.user_id == @user.id
  end
end
