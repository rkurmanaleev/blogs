module Users
  module Posts
    class RecentPostsController < UsersController
      expose_decorated(:posts) { user.posts.ordered_by_desc.limit(10) }

      def index
        render "users/posts/index", posts: posts
      end
    end
  end
end
