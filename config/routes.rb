Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/categories', to: 'categories#index'
  # get '/categories/:id', to: 'categories#show'
  # get '/categories/new', to: 'categories#new'
  # post '/categories', to: 'categories#create'
  resources :categories, only: [:index, :show, :new, :create]

  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'

  get '/categories/:id/drinks', to: 'category_drinks#index'
end
