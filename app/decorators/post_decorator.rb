class PostDecorator < ApplicationDecorator
  delegate :title, :user_id, :content, :errors
  decorates_association :comments

  def comments?
    object.comments.exists?
  end
end
