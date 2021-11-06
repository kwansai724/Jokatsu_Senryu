class Voterpost < ApplicationRecord
  belongs_to :voter

  validates :reason1, length: { maximum: 1000 }
  validates :reason2, length: { maximum: 1000 }
  validates :reason3, length: { maximum: 1000 }
  validates :reason4, length: { maximum: 1000 }
  validates :reason5, length: { maximum: 1000 }
  validates :reason6, length: { maximum: 1000 }
  validates :reason7, length: { maximum: 1000 }
  validates :reason8, length: { maximum: 1000 }
  validates :reason9, length: { maximum: 1000 }
  validates :reason10, length: { maximum: 1000 }
  validates :reason11, length: { maximum: 1000 }

end
