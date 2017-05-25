class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email

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
      object.avatar_image, :avatar_image,
      height: 150,
      width: 150,
      format: "jpg",
      fallback: "no-avatar.png",
      id: "user-avatar-img"
    )
  end
end
