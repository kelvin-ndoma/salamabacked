# app/models/blog.rb
class Blog < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def author_name
    user.name
  end

  def likes_count
    likes.count
  end
end

