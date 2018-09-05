Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'

  resources :hikers, only: [:new, :create, :show]

  # get '/signup', to: 'hiker#new', as: 'new_hiker'
  # post '/signup', to: 'hiker#create'
end
