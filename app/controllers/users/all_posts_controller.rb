module Users
  class AllPostsController < UsersController
    expose_decorated(:posts) { user.posts.ordered_by_desc }
  end
end
