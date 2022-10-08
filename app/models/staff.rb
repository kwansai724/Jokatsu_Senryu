class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:login_id]

  has_many :adminmessages, dependent: :destroy
  has_many :group_email_comments, dependent: :destroy

  validates :login_id, presence: true, length: { is: 8 }

  # 登録時にメールアドレスを不要とする
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  # importメソッド
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      staff = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      staff.attributes = row.to_hash.slice(*updatable_attributes)
      staff.save!
    end
  end

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["login_id", "group_name", "password", "password_confirmation"]
  end
end
