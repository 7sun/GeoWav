Rails.application.routes.draw do

  root 'pages#index'

  get '/playlist/:city'  => 'soundcloud#playlist'
  get '/tweets/:artist'  => 'twitter#tweets'

  get '/signup'    => 'users#new', as: :signup
  post '/signup'   => 'users#create'
  get '/login' => 'sessions#new', as: :login 
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout
 
  resources :users

  namespace :api do
    resources :playlists
  end

end
