# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  before_action :require_login

  def create
    blog = Blog.find(params[:blog_id])
    like = blog.likes.build(user_id: current_user.id)

    if like.save
      render json: { message: 'Like created successfully' }
    else
      render json: { errors: like.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    like = Like.find(params[:id])

    if like.destroy
      render json: { message: 'Like deleted successfully' }
    else
      render json: { errors: like.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
