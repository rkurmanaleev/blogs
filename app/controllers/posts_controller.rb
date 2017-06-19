class PostsController < ApplicationController
  before_action :authenticate_user!

  expose_decorated(:post)
  expose_decorated(:comment) { post.comments.build }
  expose_decorated(:posts) { fetch_posts }
  expose_decorated(:comments) { fetch_comments }

  def index
  end

  def show
  end

  private

  def fetch_posts
    Post.ordered_by_desc.includes(:user).page(params[:page])
  end

  def fetch_comments
    post.comments.ordered_by_desc
  end
end
