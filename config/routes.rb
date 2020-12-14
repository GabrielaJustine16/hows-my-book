Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}
  
  devise_scope :user do
    get 'login', to:'devise/sessions#new', as: "login"
    get 'signup', to: 'devise/registrations#new', as: "signup"
  end 
  resources :books  do
    resources :reviews
  end 

  resources :users
  #resources :reviews do 
    #resources :books, only: [:new, :index]
  #end 
    #resources :books
  #nests reviews in books so now there are mroe routes . represents belongs to and has many relationship
  root 'books#index'

  


  
end
