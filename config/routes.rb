Rails.application.routes.draw do
    # OAuth APIs
    match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
    
    # User
    root(to: 'welcome#home')
    get '/users/home', to: 'welcome#home'
end
