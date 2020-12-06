Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  #get '/auth/:provider/callback' => 'sessions#create'
  #devise_for :users
  #get '/auth/:provider/callback' => 'sessions#create'
  resources :books  do
    resources :reviews
  end 

  resources :users
  #nests reviews in books so now there are mroe routes . represents belongs to and has many relationship
  #below make index action our root path
  root 'books#index'
  #devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }


  #get '/auth/:provider/callback' => 'sessions#create'


end
