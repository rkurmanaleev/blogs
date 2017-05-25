module Posts
  class MyPostsController < PostsController
    expose_decorated(:posts) { current_user.posts.ordered_by_desc }

    def index
    end
  end
end
