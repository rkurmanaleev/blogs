class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def last_or_all_comments_header
    params[:all] ? "All posts of #{object.fullname}": "Recent posts of #{object.full_name}"
  end
end
