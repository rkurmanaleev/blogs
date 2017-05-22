class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: :destroy

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  expose_decorated(:comment)
  expose_decorated(:post)
  expose_decorated(:comments) { comments_fetch }

  def create
    comment.save
    render "posts/_index_comments", comments: comments, layout: false
  end

  def destroy
    comment.destroy
    render "posts/_index_comments", comments: comments, layout: false
  end

  private

  def comments_fetch
    post.comments.ordered_by_desc
  end

  def comment_params
    params.require(:comment).permit(:id, :content, :post_id, :user_id)
  end

  def authorize_user!
    authorize(comment, :delete?)
  end

  def user_not_authorized
    render json: "You are not authorized to perform this action.", status: 401
  end
end
