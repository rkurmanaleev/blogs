Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "posts/my_posts#index"

  # posts/:id/comments
  resources :posts do
    resources :comments, only: %i(new create destroy)
  end

  # /my_posts
  resources :my_posts, module: "posts", controller: "my_posts", only: :index

  # users/:id/posts
  resources :users, only: %i(index show) do
    resources :posts, controller: "users/posts", only: :index
  end
end
