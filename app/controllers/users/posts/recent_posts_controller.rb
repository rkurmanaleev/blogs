module Users
  module Posts
    class RecentPostsController < UsersController
      expose_decorated(:posts) { user.posts.sorted_last }

      def index
        render "users/posts/index", posts: posts
      end
    end
  end
end
