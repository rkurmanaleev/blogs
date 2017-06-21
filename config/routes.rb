Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "my_posts#index"

  resources :my_posts, controller: "my_posts", only: %i(index new create edit update destroy)

  resources :posts, only: %i(index show) do
    resources :comments, only: %i(new create destroy)
  end

  resources :users, only: %i(index show) do
    resources :posts, controller: "users_posts", only: :index
  end
end
