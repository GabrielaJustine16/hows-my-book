Rails.application.routes.draw do

  devise_for :users
  resources :books
  #below make index action our root path
  root 'books#index'


end
