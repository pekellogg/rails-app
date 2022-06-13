Rails.application.routes.draw do
    # OAuth APIs
    match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
    
    # User
    root(to: 'welcome#home')
    get '/users/home', to: 'welcome#home'


    # begin scratch
    # resources :artists, only: [:index, :new, :edit]
    resources :users, only: [:show, :new, :create, :edit, :update]

    # resources :artists, only: [:show] do
    #     resources :songs, only: [:show, :index]
    # end

    # root 'songs#index'
    # end scratch
end
