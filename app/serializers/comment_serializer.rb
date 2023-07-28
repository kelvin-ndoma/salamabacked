class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :activity_id
end
