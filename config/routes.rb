Rails.application.routes.draw do

  devise_for :voters, :controllers => {
    :registrations => 'voters/registrations',
    :sessions => 'voters/sessions'
  }

  root 'homes#index'
end
