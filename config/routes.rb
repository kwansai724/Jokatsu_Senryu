Rails.application.routes.draw do

  # rootを新規登録画面に設定
  devise_scope :voter do
    root "voters/registrations#new"
  end

  devise_for :voters, :controllers => {
    :registrations => 'voters/registrations',
    :sessions => 'voters/sessions'
  }

  # root 'homes#index'
end
