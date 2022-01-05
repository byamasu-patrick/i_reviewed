Rails.application.routes.draw do
  
  root to: "books#index"

  resources :books do
  	resources :notes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]

  get '/login' => "sessions#new", as: "login"
  delete '/logout' => "sessions#destroy", as: "logout"
  get '/signup' => "sessions#signup", as: "signup"
  post '/signup' => "sessions#create_account", as: "account"
end
