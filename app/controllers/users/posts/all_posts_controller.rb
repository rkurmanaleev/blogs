module Users
  module Posts
    class AllPostsController < UsersController
      expose_decorated(:posts) { user.posts.ordered_by_desc }

      def index
        render "users/posts/index", posts: posts
      end
    end
  end
end
