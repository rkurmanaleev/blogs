class PostDecorator < ApplicationDecorator
  TRUNCATED_TEXT_LENGTH = 500
  TRUNCATED_TITLE_LENGTH = 15

  delegate :title, :user_id, :content, :errors
  delegate :full_name, to: :user, prefix: true
  decorates_association :comments

  def short_title
    @short_title ||= h.truncate(object.title, length: TRUNCATED_TITLE_LENGTH)
  end

  def comments?
    object.comments.exists?
  end

  def user_full_name
    @user_full_name ||= object.user.full_name
  end

  def short_content
    @short_content ||= h.truncate(object.content, length: TRUNCATED_TEXT_LENGTH, separator: " ")
  end

  def created_date
    l(object.created_at, format: :long_date)
  end

  def post_user_path
    h.user_path(object.user)
  end
end
