class Choice < ApplicationRecord

  belongs_to :quiz

  validates :choice, presence: true
  validates :anwser_is, acceptance: true
  
end
