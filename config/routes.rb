Rails.application.routes.draw do
  devise_for :voters
  root 'homes#index'
end
