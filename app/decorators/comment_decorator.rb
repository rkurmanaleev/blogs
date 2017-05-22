class CommentDecorator < ApplicationDecorator
  delegate :content, :user_id, :post_id, :updated_at
  delegate :full_name, :avatar_image, to: :user, prefix: true

  def user_full_name
    @user_full_name ||= object.user.full_name
  end

  def user_avatar_image
    h.attachment_image_tag(
      object.user.avatar_image, :avatar_image,
      format: "jpg",
      fallback: "no-avatar.png",
      id: "user-avatar-img",
      class: "avatar"
    )
  end

  def link_to_user
    h.link_to(user_full_name, h.user_path(object.user_id))
  end

  def formatted_time
    l(object.created_at, format: :long_date)
  end
end
