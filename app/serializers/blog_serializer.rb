# app/serializers/blog_serializer.rb
class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :author_name, :published_at, :likes_count

  def author_name
    object.user.name
  end

  def likes_count
    object.likes.count
  end
end

