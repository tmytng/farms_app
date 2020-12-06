Rails.application.routes.draw do
  root "users#index"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  devise_scope :user do
    get 'users/:id/edit' => 'users/registrations#edit', as: :edit_other_user_registration
    match 'users/:id', to: 'users/registrations#update', via: [:patch, :put], as: :other_user_registration
  end

  resources :users

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
    end
  end

  resources :projects do
    resources :posts do
      post :import, on: :collection
    end
  end
  resources :projects do
    resources :message
  end
end
