Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "posts#index"

  resources :posts do
    resources :comments, only: %i(show destroy)
  end
  resources :users, only: :show
end
