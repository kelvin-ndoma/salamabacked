class UsersController < ApplicationController
  skip_before_action :authorize, only: [:create, :show]
 
  def create 
    user = User.new(user_params)
    # Set the default role to 'normal' for newly created users
    user.role = :normal

    if user.save
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
