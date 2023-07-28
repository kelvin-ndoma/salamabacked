# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :authorize_normal_user, only: :create

  def create
    activity = Activity.find(params[:activity_id])
    comment = activity.comments.build(comment_params)
    comment.user = current_user # Set the user for the comment

    if comment.save
      render json: comment, status: :created
    else
      render json: { error: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def authorize_normal_user
    unless current_user && current_user.normal?
      render json: { error: 'Only normal users can comment.' }, status: :forbidden
    end
  end
end
