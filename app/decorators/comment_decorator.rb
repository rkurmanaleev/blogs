class CommentDecorator < ApplicationDecorator
  delegate :content, :user_id, :post_id, :user, :updated_at
  delegate :full_name, to: :user, prefix: true

  def user_full_name
    @user_full_name ||= object.user.full_name
  end

  def link_to_user
    h.link_to(user_full_name, h.user_path(object.user_id))
  end

  def formatted_time
    l(object.created_at, format: :long_date)
  end
end
