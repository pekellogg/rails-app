Rails.application.routes.draw do
    # app root
    root "users#home"

    # OAuth
    # match "/auth/:provider/callback", to: "sessions#create", via: [:post, :get]
    get "/auth/:provider/callback", to: "sessions#create"
    
    # Session Tracking
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  
    # User
    resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
    resources :users, only: [:show] do
        resources :projects, only: [:new, :create, :show, :edit, :update, :index, :destroy]
    end

    # Contractor
    resources :contractors, only: [:create, :index, :show, :update]

    # License
    resources :licenses, only: [:index]
end
