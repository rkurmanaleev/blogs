class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  expose(:posts_sidebar) { fetch_sidebar_posts }
  expose(:comments_sidebar) { fetch_sidebar_comments }

  private

  def fetch_sidebar_posts
    PostDecorator.decorate_collection(Post.sorted_recent)
  end

  def fetch_sidebar_comments
    CommentDecorator.decorate_collection(Comment.sorted_recent)
  end
end
