class Activity < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :ratings, dependent: :destroy
  
    validates :name, presence: true
    validates :description, presence: true
    validates :scheduled_time, presence: true
  
    # Picture upload using Active Storage (assuming you have set up Active Storage)
    # has_one_attached :picture
  end
  
