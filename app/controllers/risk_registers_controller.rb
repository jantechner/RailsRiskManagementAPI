class RiskRegistersController < ApplicationController
  wrap_parameters :risk_register
  before_action :set_project, only: %i[index create]
  before_action :set_risk_register, except: %i[index create]

  def index
    render json: @project.risk_registers
  end

  def show
    render json: @risk_register
  end

  def create
    @risk_register = @project.risk_registers.create!(risk_register_params)
    render json: @risk_register
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def update
    @risk_register.update!(risk_register_params)
    render json: @risk_register
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def destroy
    @risk_register.destroy
    render status: :no_content
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end

  def set_risk_register
    @risk_register = RiskRegister.find(params[:id])
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end

  def risk_register_params
    params.require(:risk_register).permit(:category, :owner_id)
  end
end
