class CommentDecorator < ApplicationDecorator
  delegate :id, :content, :post, :user, :created_on, :updated_on

  def formatted_date
    object.created_at.strftime("%Y-%m-%d %H:%M")
  end
end
