Rails.application.routes.draw do

  resources :books
  #below make index action our root path
  root 'books#index'


end
