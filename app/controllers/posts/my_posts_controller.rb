module Posts
  class MyPostsController < PostsController
    expose_decorated(:user) { current_user }
    expose_decorated(:posts) { user.posts }

    def index
    end
  end
end
