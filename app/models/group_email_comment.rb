class GroupEmailComment < ApplicationRecord
  belongs_to :staff

  validates :subject, presence: true
  validates :comment, presence: true
end
