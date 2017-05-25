class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  expose(:posts_sidebar) { Post.all.ordered_by_desc.last(5) }
  expose(:comments_sidebar) { Comment.all.ordered_by_desc.last(5) }
end
