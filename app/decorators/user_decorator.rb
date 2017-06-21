class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :avatar_image

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
    user.posts.any?
  end

  def avatar_image_tag(height = 130, width = 130, div_class = "user-avatar")
    h.attachment_image_tag(
      object, :avatar_image,
      :fit, height, width,
      class: div_class,
      format: "jpg",
      fallback: "no-avatar.png",
      id: "user-avatar-img"
    )
  end

  def avatar_image_url
    h.attachment_url(object, :avatar_image)
  end

  def avatar_with_download_link
    h.link_to(avatar_image_url) { avatar_image_tag }
  end
end
