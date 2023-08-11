class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:index, :show]

  def index
    blogs = Blog.all
    render json: blogs
  end

  def show
    render json: blog
  end

  def create
    blog = current_user.blogs.build(blog_params)
    if blog.save
      render json: blog, status: :created
    else
      render json: { errors: blog.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if blog.update(blog_params)
      render json: blog
    else
      render json: { errors: blog.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    blog.destroy
    head :no_content
  end

  def toggle_like
    @blog = Blog.find(params[:id])
  
    if current_user && !current_user.likes.exists?(blog: @blog)
      like = current_user.likes.build(blog: @blog)
      if like.save
        render json: { success: true }
      else
        render json: { success: false, errors: like.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { success: false, errors: ["User already liked the blog"] }, status: :unprocessable_entity
    end
  end

  def my_blogs
    if current_user
      blogs = current_user.blogs
      render json: blogs
    else
      render json: { errors: ["Please log in"] }, status: :unauthorized
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog
    Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :published_at)
  end

  def authorize_user
    unless current_user
      render json: { errors: ["Please log in"] }, status: :unauthorized
    end
  end
end
