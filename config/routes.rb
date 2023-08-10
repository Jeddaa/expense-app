Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # if user_signed_in?
  #   root "items#index"
  # else
  #   root "home#index"
  # end
  authenticated :user do
    root to: "categories#index", as: :authenticated_root
  end

  unauthenticated :user do
    root "home#index", as: :unauthenticated_root
  end

  resources :users
  resources :categories, only: %i[index show new create] do
    resources :items, only: %i[new create]
  end

  # root to: "home#index"


end
