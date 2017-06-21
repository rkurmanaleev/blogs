class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  expose_decorated(:posts_sidebar, decorator: PostDecorator) { Post.sorted_recent.decorate }
  expose_decorated(:comments_sidebar, decorator: CommentDecorator) { Comment.sorted_recent.decorate }
end
