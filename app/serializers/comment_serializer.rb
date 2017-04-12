class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :post, :created, :userfullname

  def userfullname
    object.user.full_name
  end

  def created
    object.created_at
  end

  def post
    object.post_id
  end

  def user
    object.user_id
  end
end
