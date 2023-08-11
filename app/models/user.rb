# app/models/user.rb
class User < ApplicationRecord
  enum role: { normal: 0, admin: 1 }

  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
