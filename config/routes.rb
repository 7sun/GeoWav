Rails.application.routes.draw do

  root 'pages#index'
  get '/soundcloud'   => 'soundcloud#users'
  get '/embeds'       => 'soundcloud#embeds'
  get '/music-player' => 'pages#soundcloud'
  get '/twitter'      => 'twitter#index', as: :twitter

  get '/signup'    => 'users#new', as: :signup
  get '/login' => 'sessions#new', as: :login 
  post '/login' => 'sessions#create'
 
 resources :users

end
