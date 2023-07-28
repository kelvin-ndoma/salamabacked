class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :picture, :description, :scheduled_time

  has_many :comments
  has_many :ratings
end


