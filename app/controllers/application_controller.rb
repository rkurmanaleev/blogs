class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  expose(:posts_sidebar) { Post.sorted_recent }
  expose(:comments_sidebar) { Comment.sorted_recent }
end
