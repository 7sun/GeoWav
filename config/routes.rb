Rails.application.routes.draw do

  get '/soundcloud'   => 'soundcloud#users'
  get '/embeds'       => 'soundcloud#embeds'
  get '/music-player' => 'pages#soundcloud'
  get '/twitter'      => 'twitter#index'
 
end
