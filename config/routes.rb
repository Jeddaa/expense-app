Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

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
end
