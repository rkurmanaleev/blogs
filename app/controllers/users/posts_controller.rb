module Users
  class PostsController < UsersController
    expose_decorated(:posts) { user.posts.ordered_by_desc.page(params[:page]) }

    respond_to :html, :js

    def index
      render "users/posts/index", posts: posts
    end
  end
end
