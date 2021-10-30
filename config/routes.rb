Rails.application.routes.draw do

  # # rootの設定
  # devise_scope :voter do
  #   constraints -> request { request.session[:admin].present? } do
  #     # ログインしてる時
  #     # root 'voters/voters#admin', constraints: LoggedInConstraint.new("true") # 管理者としてログインしている場合
  #     root 'posts#index', constraints: LoggedInConstraint.new("false") # 投票者としてログインしている場合

  #   end
  #   # ログインしてない時
  #   root "voters/registrations#new"
  # end

  devise_scope :voter do
    constraints -> request { request.session[:admin].present? || request.session[:voter_id].present? } do
      root 'posts#index', as: :public_root, constraints: LoggedInConstraint.new("voter") # 投票者としてログインしている場合
      root 'staffs/staffs#toppage', constraints: LoggedInConstraint.new("true") # WIPとしてログインしている場合
      root 'staffs/staffs#toppage', constraints: LoggedInConstraint.new("false") # スポンサー企業としてログインしている場合
    end
    root "voters/registrations#new"
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
    end
  end

  # 川柳投票
  resources :posts do
    resource :likes, only: [:create, :destroy]
  end

  # 投票者ページ
  namespace :voters do
    # get 'voters/index', to: 'voters#index'
    get 'voters/admin', to: 'voters#admin'
    get 'voters/users_index', to: 'voters#users_index'
    get 'voters/users_show', to: 'voters#users_show'
  end

  # 管理者・スタッフページ
  namespace :staffs do
    get 'staffs/toppage', to: 'staffs#toppage'
    get 'staffs/index', to: 'staffs#index'
  end

end
