class Play < ApplicationRecord

  validates :quiz_no, numericality: { other_than: 0 }
  
end
