class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :value, presence: true, inclusion: { in: 1..5 }
end
