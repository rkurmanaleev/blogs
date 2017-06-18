class PostsController < ApplicationController
  before_action :authenticate_user!

  expose_decorated(:post)
  expose_decorated(:comment) { post.comments.build }
  expose_decorated(:posts) { posts_fetcher }
  expose_decorated(:comments) { comments_fetcher }

  def index
  end

  def show
  end

  private

  def posts_fetcher
    Post.ordered_by_desc.includes(:user).page(params[:page])
  end

  def comments_fetcher
    post.comments.ordered_by_desc
  end
end
