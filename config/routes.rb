Rails.application.routes.draw do

  get 'group_email_comments/index'
  get 'group_email_comments/edit'
  devise_scope :voter do
    constraints -> request { request.session[:admin].present? || request.session[:voter_id].present? } do
      root 'voterposts#index', as: :voter_root, constraints: LoggedInConstraint.new("voter") # 投票者としてログインしている場合
      root 'staffs/staffs#toppage', as: :wip_root, constraints: LoggedInConstraint.new("true") # WIPとしてログインしている場合
      root 'staffs/staffs#toppage', as: :other_root, constraints: LoggedInConstraint.new("false") # スポンサー企業としてログインしている場合
    end
    root "voters/registrations#new", as: :public_root
  end

  devise_for :voters, :controllers => {
    :registrations => 'voters/registrations',
    :sessions => 'voters/sessions'
  }

  devise_for :staffs, :controllers => {
    :registrations => 'staffs/registrations',
    :sessions => 'staffs/sessions'
  }

  # 川柳投稿者
  resources :users, only: [:create, :index] do
    collection do
      post :confirm
      get :thanks
    end
  end
  # resources :posts
  
  # 川柳投票
  resources :voterposts do
    resource :likes, only: [:create, :destroy]
  end

  # 管理者・スタッフページ
  namespace :staffs do
    get 'staffs/toppage', to: 'staffs#toppage'
    get 'staffs/index', to: 'staffs#index'
    get 'staffs/users_index', to: 'staffs#users_index'
    get 'staffs/users_graph', to: 'staffs#users_graph'
    get 'staffs/users_show', to: 'staffs#users_show'
    get 'staffs/voterposts_index', to: 'staffs#voterposts_index'
    get 'staffs/voterposts_show', to: 'staffs#voterposts_show'
    post 'staffs/voterposts_index/import', to: 'staffs#import'
    get 'staffs/group_index', to: 'staffs#group_index'
  end

  # adminmessageメール内容変更
  resources :adminmessages
  # 一斉メール  
  resources :group_email_comments do
    member do
      get 'group_email'
    end
  end   
    
end
