Rails.application.routes.draw do

  # rootを新規登録画面に設定
  devise_scope :voter do
    root "voters/registrations#new"
  end

  devise_for :voters, :controllers => {
    :registrations => 'voters/registrations',
    :sessions => 'voters/sessions'
  }

  # 投票者ページ
  namespace :voters do
    get 'voters/index', to: 'voters#index'
  end  

end
