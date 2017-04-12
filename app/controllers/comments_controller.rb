class CommentsController < ApplicationController
  before_action :authenticate_user!

  expose(:comment)
  expose(:post)
  expose(:comments) { comments_fetch }
  expose(:user)

  respond_to :json

  def index
    if is_a_number?(params[:post_id])
      render json: comments, status: 200
    else
      render json: {error: "Params error"}, status: 422
    end
  end

  def create
    if comment.save
      render json: comment, include: { user: { only: :full_name } }, status: 200
    else
      render json: comment.errors, status: 422
    end
  end

  def destroy
    if comment.destroy
      render json: comment, status: :ok
    else
      render json: comment.errors, status: 422
    end
  end

  private

  def is_a_number?(string)
    Float(string) != nil rescue false
  end

  def comments_fetch
    post.comments.ordered_by_desc
  end

  def comment_params
    params.require(:comment).permit(:id, :content, :post_id, :user_id)
  end
end
