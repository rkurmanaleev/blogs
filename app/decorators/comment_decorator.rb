class CommentDecorator < ApplicationDecorator
  delegate :content, :created_on, :user_id
  delegate :full_name, to: :user, prefix: true

  def user_full_name
    @user_full_name ||= object.user.full_name
  end

  def formatted_date
    @formatted_date ||= object.created_at.strftime("%Y-%m-%d %H:%M")
  end
end
