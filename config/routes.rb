Rails.application.routes.draw do


  resources :owners do
    resources :pets
  end
  
  resources :groomers 

  resources :appointments, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  get '/register', to: 'sessions#register'
  post '/register', to: 'sessions#registered'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout'
 root to: 'sessions#home'
  
  #Omniauth
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
