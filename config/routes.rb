Rails.application.routes.draw do
  get 'users/index', to: 'users#index'
  get 'users/new', to: 'users#new'
  post 'users/create', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
