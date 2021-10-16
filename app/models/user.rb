class User < ApplicationRecord

  # 投稿者一覧の検索機能
  scope :search, -> (search_params) do
    return if search_params.blank?

    name_like(search_params[:name])
  end
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
end
