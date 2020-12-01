Rails.application.routes.draw do

  devise_for :users
  resources :books  do
    resources :reviews
  end 
  #nests reviews in books so now there are mroe routes . represents belongs to and has many relationship
  #below make index action our root path
  root 'books#index'


end
