class Voter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, through: :likes
  has_many :likes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable,
         :authentication_keys => [:name]

  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  validates :group, presence: true

  # # nameを利用してログイン
  # def self.find_first_by_auth_conditions(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions).where(["name = :value", { :value => name }]).first
  #   else
  #     where(conditions).first
  #   end
  # end

  #登録時にメールアドレスを不要とする
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
 
end
