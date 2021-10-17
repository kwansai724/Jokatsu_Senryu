class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts, allow_destroy: true

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :gender, presence: true
  validates :address, presence: true
  validates :profession, presence: true
  validates :age, presence: true
  validates :questionary, presence: true
  
  # 投稿者一覧の検索機能
  scope :search, -> (search_params) do
    return if search_params.blank?

    name_like(search_params[:name])
  end
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  
end
