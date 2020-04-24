class UsersController < ApplicationController
  wrap_parameters :user
  before_action :set_user, only: %i[show update destroy projects]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(user_params)
    if @user
      render json: @user, status: :accepted
    else
      render status: :bad_request
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :accepted
    else
      render status: :bad_request
    end
  end

  def destroy
    @user.destroy
    render json: {status: 'User deleted'}, status: :accepted
  end

  def projects
    render json: @user.projects
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {error: 'User not found'}, status: :not_found
  end

  def user_params
    params.require(:user).permit(:name, :surname)
  end
end
