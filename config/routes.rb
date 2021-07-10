Rails.application.routes.draw do
  root to: "transactions#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"

  resources :transactions do
    collection do
      post "search"
    end
  end

  resources :users, only: [:new, :create, :destroy]

  get 'interrock/index'
  get 'interrock/subcategories'
end
