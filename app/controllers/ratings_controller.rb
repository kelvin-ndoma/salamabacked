class RatingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def create
    activity = Activity.find(params[:activity_id])
    if current_user.normal?
      rating = current_user.ratings.build(activity: activity, value: params[:value])

      if rating.save
        render json: rating, status: :created
      else
        render json: { errors: rating.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: ['You are not authorized to rate this activity'] }, status: :unauthorized
    end
  end

  def update
    rating = current_user.ratings.find(params[:id])

    if rating.update(value: params[:value])
      render json: rating, status: :ok
    else
      render json: { errors: rating.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    rating = current_user.ratings.find(params[:id])
    rating.destroy
    render json: {}, status: :no_content
  end
end
