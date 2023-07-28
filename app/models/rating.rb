class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :value, presence: true
  validates :value, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
