Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  resources :users do
    collection do
      get :test
    end
  end
  resources :projects do
    resources :posts, :messages
  end
end
