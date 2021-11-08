class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  validates :first_phrase, length: { maximum: 30 }
  validates :second_phrase, length: { maximum: 30 }
  validates :third_phrase, length: { maximum: 30 }
  validates :pen_name, length: { maximum: 50 }

end
