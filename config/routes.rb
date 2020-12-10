Rails.application.routes.draw do
  root "projects#index"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  devise_scope :user do
    get 'users/:id/edit' => 'users/registrations#edit', as: :edit_other_user_registration
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    match 'users/:id', to: 'users/registrations#update', via: [:patch, :put], as: :other_user_registration
  end

  resources :users

  # resources :projects do
  #   collection do
  #     get 'search'
  #   end
  # end

  resources :projects do
    get :search, on: :collection
    resources :posts do
      post :import, on: :collection
    end
  end

  resources :projects do
    resources :message
  end
end
