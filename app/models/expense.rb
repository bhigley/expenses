class Expense < ApplicationRecord
  validates :month, presence: true
  validates :year, presence: true
  validates :total, presence: true
  validates :user, presence: true, length: {minimum: 3}

  belongs_to :user
end
