class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  
  def index
    activities = Activity.all
    render json: activities
  end

  def show
    activity = Activity.find(params[:id])
    render json: activity, include: ['comments', 'ratings']
  end

  def create
    activity = Activity.new(activity_params)
    if activity.save
      render json: activity, status: :created
    else
      render json: { errors: activity.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    activity = Activity.find(params[:id])
    if activity.update(activity_params)
      render json: activity, status: :ok
    else
      render json: { errors: activity.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    render json: {}, status: :no_content
  end

  def rate
    activity = Activity.find(params[:id])
    if current_user.normal?
      rating = current_user.ratings.find_or_initialize_by(activity: activity)
      rating.value = params[:value]

      if rating.save
        render json: rating, status: :ok
      else
        render json: { errors: rating.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: ['You are not authorized to rate this activity'] }, status: :unauthorized
    end
  end

  def comment
    activity = Activity.find(params[:id])
    if current_user.normal?
      comment = current_user.comments.build(activity: activity, content: params[:content])

      if comment.save
        render json: comment, status: :created
      else
        render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: ['You are not authorized to comment on this activity'] }, status: :unauthorized
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :picture, :description, :scheduled_time)
  end

  def authenticate_user!
    unless current_user
      render json: { errors: ['Not authorized'] }, status: :unauthorized
    end
  end
end
