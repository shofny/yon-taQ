class Quiz < ApplicationRecord
  belongs_to :user
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices

  validates_associated :choices

  validates :quiz, presence: true
end
