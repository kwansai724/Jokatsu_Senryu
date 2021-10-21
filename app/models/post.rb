class Post < ApplicationRecord
  belongs_to :user
  has_many :voters, through: :likes
  has_many :likes
  accepts_nested_attributes_for :likes
end
