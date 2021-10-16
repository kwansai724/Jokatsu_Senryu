Rails.application.routes.draw do

  # rootを新規登録画面に設定
  devise_scope :voter do
    root "voters/registrations#new"
  end

  devise_for :voters, :controllers => {
    :registrations => 'voters/registrations',
    :sessions => 'voters/sessions'
  }

  # 川柳投稿者
  get 'users/index', to: 'users#index'
  get 'users/new', to: 'users#new'
  post 'users/create', to: 'users#create'

  # 投票者ページ
  namespace :voters do
    get 'voters/index', to: 'voters#index'
    get 'voters/admin', to: 'voters#admin'
    get 'voters/users_index', to: 'voters#users_index'
    get 'voters/users_show', to: 'voters#users_show'
  end  

end
