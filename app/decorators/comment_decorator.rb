class CommentDecorator < ApplicationDecorator
  delegate :content, :created_at, :user_id, :post_id, :updated_at, :user
  delegate :full_name, to: :user, prefix: true
  decorates_association :post

  def user
    user_full_name
  end

  def updated_at
    user_full_name
  end

  def user_full_name
    @user_full_name ||= object.user.full_name
  end

  def formatted_date
    @formatted_date ||= l object.created_at, format: :ru
  end
end
