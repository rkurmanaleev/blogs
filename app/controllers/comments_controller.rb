class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: :destroy

  expose(:comment)
  expose_decorated(:post)
  expose_decorated(:comments) { fetch_comments }

  def create
    comment.post = post
    comment.user = current_user

    self.comment = post.comments.build if comment.save

    render "fragments/_fragments", comments: comments, layout: false
  end

  def destroy
    comment.destroy

    render "fragments/_fragments", comments: comments, layout: false
  end

  private

  def fetch_comments
    post.comments.ordered_by_desc
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def authorize_user!
    authorize(comment, :delete?)
  end
end
