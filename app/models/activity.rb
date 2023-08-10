class Activity < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :scheduled_time, presence: true

 
end
