Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/categories', to: 'categories#index'
  # get '/categories/:id', to: 'categories#show'
  # get '/categories/new', to: 'categories#new'
  # post '/categories', to: 'categories#create'
  # get '/categories/:id/edit', to: 'categories#edit'
  # patch '/categories/:id', to: 'categories#update'
  resources :categories

  get '/categories/:id/drinks', to: 'category_drinks#index'
  get '/categories/:id/drinks/new', to: 'category_drinks#new'
  post '/categories/:id/drinks/new', to: 'category_drinks#create'
  # resources :category_drinks, only: [:index, :new, :create]

  # get '/drinks', to: 'drinks#index'
  # get '/drinks/:id', to: 'drinks#show'
  # get '/drinks/:id/edit', to: 'drinks#edit'
  # patch '/drinks/:id', to: 'drinks#update'
  resources :drinks, except: [:new, :create]
end
