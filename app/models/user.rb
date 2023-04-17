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
  validates :note, length: { maximum: 1000 }
  validates :questionary, presence: true

  ADDRESSES = %w[
    北海道 青森県 岩手県 宮城県 秋田県 山形県
    福島県 茨城県 栃木県 群馬県 埼玉県 千葉県
    東京都 神奈川県 新潟県 富山県 石川県 福井県
    山梨県 長野県 岐阜県 静岡県 愛知県 三重県
    滋賀県 京都府 大阪府 兵庫県 奈良県 和歌山県
    鳥取県 島根県 岡山県 広島県 山口県 徳島県
    香川県 愛媛県 高知県 福岡県 佐賀県 長崎県
    熊本県 大分県 宮崎県 鹿児島県 沖縄県
  ].freeze

  PROFESSION = %w[
    専業主婦 会社員 公務員 自営業 フリーランス・自由業
    会社経営者・役員 団体職員 派遣社員 パート・アルバイト
    小・中学生 高校生・受験生 専門学校・大学生 大学院・研究生
    家事手伝い 無職 その他
  ].freeze

  AGE = %w[
    小学生 中学生 高校生 大学生
    20代 30代 40代 50代 60代
    70代 80代以上
  ].freeze

  # 投稿者一覧の検索機能
  scope :search, ->(search_params) { name_like(search_params[:name]) unless search_params.blank? }

  scope :name_like, ->(name) { where('name LIKE ?', "%#{name}%") if name.present? }
end
