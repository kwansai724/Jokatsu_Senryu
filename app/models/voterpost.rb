class Voterpost < ApplicationRecord
  # belongs_to :voter
  # has_many :voters, through: :likes
  belongs_to :voter
  # accepts_nested_attributes_for :voter, allow_destroy: true
  has_many :likes, dependent: :destroy
  
  # accepts_nested_attributes_for :likes
end
