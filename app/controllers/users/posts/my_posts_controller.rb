module Users
  module Posts
    class MyPostsController < UsersController
      expose_decorated(user) { current_user }
      expose_decorated(posts) { current_user.posts }

      def index
      end
    end
  end
end
