class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: %i(edit update destroy)

  expose_decorated(:post)
  expose_decorated(:posts) { posts_fetcher }
  expose_decorated(:comment) { comment_fetcher }
  expose_decorated(:comments) { comments_fetcher }

  def show
  end

  def new
  end

  def create
    post.update(user_id: current_user.id)
    respond_with post
  end

  def edit
  end

  def update
    post.update(post_params)
    respond_with post
  end

  def destroy
    post.destroy
    respond_with(post, location: my_posts_url)
  end

  private

  def posts_fetcher
    Post.sorted_last
  end

  def comment_fetcher
    post.comments.build(user: current_user, post: post)
  end

  def comments_fetcher
    post.comments.ordered_by_desc
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def authorize_user!
    authorize(post, :manage?)
  end
end
