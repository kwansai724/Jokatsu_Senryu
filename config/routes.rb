Rails.application.routes.draw do
  get 'users/index', to: 'users#index'
  get 'users/new', to: 'users#new'
  post 'users/create', to: 'users#create'
  devise_for :voters
  root 'homes#index'
end
