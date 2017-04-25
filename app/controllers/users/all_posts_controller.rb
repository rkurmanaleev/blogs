module Users
  class AllPostsController < UsersController
    expose_decorated(:posts) { user.posts.ordered_by_desc.includes(:taggings) }
  end
end
