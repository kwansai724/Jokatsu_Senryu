class Like < ApplicationRecord
  belongs_to :voter
  belongs_to :post
end
