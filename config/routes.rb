Rails.application.routes.draw do
  # rootの設定
  devise_scope :voter do
    constraints -> request { request.session[:admin].present? } do
      # ログインしてる時
      root 'voters/voters#admin', constraints: LoggedInConstraint.new("true") # 管理者としてログインしている場合
      root 'voterposts#index', constraints: LoggedInConstraint.new("false") # 投票者としてログインしている場合
    end
    # ログインしてない時
    root "voters/registrations#new"
  end

  devise_for :voters, :controllers => {
    :registrations => 'voters/registrations',
    :sessions => 'voters/sessions'
  }

  # 川柳投稿者
  resources :users, only: [:create, :index] do
    collection do
      post :confirm
    end
  end
  resources :posts
  
  # 川柳投票
  resources :voterposts do
    member do
      # post :create_voterpost
    end
    resource :likes, only: [:create, :destroy]
  end

  # 投票者ページ
  namespace :voters do
    # get 'voters/index', to: 'voters#index'
    get 'voters/admin', to: 'voters#admin'
    get 'voters/users_index', to: 'voters#users_index'
    get 'voters/users_show', to: 'voters#users_show'
  end  

end
