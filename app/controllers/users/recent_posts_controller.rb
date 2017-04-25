module Users
  class RecentPostsController < UsersController
    expose_decorated(:posts) { user.posts.ordered_by_desc.latest.includes(:taggings) }
  end
end
