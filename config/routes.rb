Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/categories', to: 'categories#index'
  get '/categories/:id', to: 'categories#show'

  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'

  get '/categories/:id/drinks', to: 'category_drinks#index'
end
