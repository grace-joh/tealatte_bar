Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/categories', to: 'categories#index'
  # get '/categories/:id', to: 'categories#show'
  # get '/categories/new', to: 'categories#new'
  # post '/categories', to: 'categories#create'
  # get '/categories/:id/edit', to: 'categories#edit'
  # patch '/categories/:id', to: 'categories#update'
  resources :categories, except: [:destroy]

  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'

  get '/categories/:id/drinks', to: 'category_drinks#index'
end
