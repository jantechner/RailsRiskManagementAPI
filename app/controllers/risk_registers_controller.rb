class RiskRegistersController < ApplicationController
  wrap_parameters format: :json
  before_action :set_project
  before_action :set_risk_register, only: %i[show update destroy]

  def index
    @risk_registers = @project.risk_registers
    render json: @risk_registers, status: :ok
  end

  def show
    render json: @risk_register, status: :ok
  end

  def create
    @risk_register = @project.risk_registers.create(risk_register_params)
    if @risk_register
      render json: @risk_register, status: :accepted
    else
      render status: :bad_request
    end
  end

  def update
    res = @risk_register.update(risk_register_params)
    if res
      render json: @risk_register, status: :accepted
    else
      render status: :bad_request
    end
  end

  def destroy
    @risk_register.destroy
    render json: {status: "Risk register deleted"}, status: :accepted
  end

  private

  def set_project
    begin
      @project = Project.find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
      render json: {error: "No project with given ID"}, status: :not_found
    end
  end

  def set_risk_register
    begin
      @risk_register = @project.risk_registers.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {error: "No risk register with given ID"}, status: :not_found
    end
  end

  def risk_register_params
    logger.debug params
    params.require(:risk_register).permit(:category, :owner_id)
  end
end
