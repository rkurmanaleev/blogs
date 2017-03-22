Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "posts#index"

  resources :posts do
    resources :comments, only: %i(new create show destroy)
  end
  resources :users, only: :show do
    resources :all_posts, controller: "users/all_posts", only: :index
  end
end
