class UsersController < ApplicationController
  wrap_parameters :user
  before_action :set_user, except: %i[index create]

  def index
    render json: User.all
  end

  def show
    render json: @user
  end

  def create
    @user = User.create!(user_params)
    render json: @user
  rescue StandardError => e
    render json: { error: e.messgae }, status: :internal_server_error
  end

  def update
    @user.update!(user_params)
    render json: @user, status: :accepted
  rescue StandardError => e
    render json: { error: e.messgae }, status: :internal_server_error
  end

  def destroy
    @user.destroy
    render status: :no_content
  end

  def projects
    render json: @user.projects
  end

  def risk_registers
    render json: @user.risk_registers
  end

  def risks
    render json: @user.risks
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:name, :surname)
  end
end
