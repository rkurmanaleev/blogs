Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "posts#index"

  # posts/:id/comments
  resources :posts do
    resources :comments, only: %i(new create destroy)
  end

  # users/:id/posts/all_posts
  # users/:id/posts/recent_posts
  # users/:id/posts/my_posts
  resources :users, only: %i(index show) do
    namespace :posts, module: nil do
      resources :all_posts, controller: "users/posts/all_posts", only: :index
      resources :recent_posts, controller: "users/posts/recent_posts", only: :index
      resources :my_posts, controller: "users/posts/my_posts", only: :index
    end
  end
end
