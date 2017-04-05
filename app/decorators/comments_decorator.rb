class CommentsDecorator < Draper::CollectionDecorator
  delegate :includes, :user_full_name

  def user
    object.user.full_name
  end
end
