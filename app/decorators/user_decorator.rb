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
end
