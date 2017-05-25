class PostPolicy < ApplicationPolicy
  def manage?
    @record.user_id == @user.id
  end
end
