# app/controllers/ratings_controller.rb
class RatingsController < ApplicationController
  before_action :authorize_normal_user, only: :create

  def create
    activity = Activity.find(params[:activity_id])
    rating = activity.ratings.build(rating_params)
    rating.user = current_user

    if rating.save
      render json: rating, status: :created
    else
      render json: { error: rating.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:value)
  end

  def authorize_normal_user
    unless current_user && current_user.normal?
      render json: { error: 'Only normal users can rate activities.' }, status: :forbidden
    end
  end
end
