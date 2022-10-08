class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  validates :first_phrase, length: { maximum: 30 }
  validates :second_phrase, length: { maximum: 30 }
  validates :third_phrase, length: { maximum: 30 }
  validates :pen_name, length: { maximum: 50 }
  validate :category_valid, on: :category_valid

  def category_valid
    if first_phrase.present? && category.blank?
      errors.add(:category, "を入力してください")
    end
  end
end
