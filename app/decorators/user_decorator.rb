class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :avatar_image, :avatar_image_id

  def full_name_with_email
    @full_name_with_email ||= "#{object.full_name} (#{object.email})"
  end

  def posts_stat
    @posts_stat ||= "Total Posts: #{object.posts.size}"
  end

  def comments_stat
    @comments_stat ||= "Total Comments: #{object.comments.size}"
  end

  def posts?
    return true if user.posts.any?
  end

  def avatar_image_tag
    h.attachment_image_tag(
      object, :avatar_image,

      class: "user-avatar",
      format: "jpg",
      fallback: "no-avatar.png",
      id: "user-avatar-img"
    )
  end

  def avatar_image_url
    h.attachment_url(
      object, :avatar_image
    )
  end
end
