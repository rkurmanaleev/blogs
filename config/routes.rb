Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "posts/my_posts#index"

  # posts/:id/comments
  resources :posts do
    resources :comments, only: %i(new create destroy)
  end

  # /my_posts
  resources :my_posts, module: "posts", controller: "my_posts", only: :index

  # users/:id/posts/all_posts
  # users/:id/posts/recent_posts
  resources :users, only: %i(index show) do
    resources :all_posts, controller: "users/posts/all_posts", path: "/posts/all_posts", only: :index
    resources :recent_posts, controller: "users/posts/recent_posts", path: "/posts/recent_posts", only: :index
  end
end
