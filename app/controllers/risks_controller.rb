class RisksController < ApplicationController
  wrap_parameters :risk
  before_action :set_risk_register, only: %i[index create]
  before_action :set_risk, except: %i[index create]

  def index
    render json: @risk_register.risks
  end

  def show
    render json: @risk
  end

  def create
    @risk = @risk_register.risks.create!(risk_params)
    render json: @risk
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def update
    @risk.update!(risk_params)
    render json: @risk
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def destroy
    @risk.destroy
    render status: :no_content
  end

  private

  def set_risk_register
    @risk_register = RiskRegister.find(params[:risk_register_id])
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  def set_risk
    @risk = Risk.find(params[:id])
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  def risk_params
    params.require(:risk).permit(
        :description,
        :likelihood,
        :impact,
        :severity,
        :owner_id,
        :status
    )
  end
end
