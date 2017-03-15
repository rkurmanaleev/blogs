class PostDecorator < ApplicationDecorator
  delegate :id, :title, :content, :user, :comments, :errors

  def comments?
    object.comments.exists?
  end
end
