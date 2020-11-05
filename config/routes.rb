Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  resources :users
  resources :projects do
    resources :posts, :messages
  end
end
