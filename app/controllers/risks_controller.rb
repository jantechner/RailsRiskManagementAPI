class RisksController < ApplicationController
  wrap_parameters :risk
  before_action :set_risk_register, only: %i[index create]
  before_action :set_risk, except: %i[index create]

  def index
    @risks = @risk_register.risks
    render json: @risks
  end

  def show
    render json: @risk
  end

  def create
    @risk = @risk_register.risks.create!(risk_params)
    render json: @risk, status: :accepted
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :bad_request
  rescue StandardError
    render json: { error: 'Server error' }, status: :internal_server_error
  end

  def update
    if @risk.update!(risk_params)
      render json: @risk, status: :accepted
    else
      render status: :bad_request
    end
  end

  def destroy
    @risk.destroy
    render json: { status: 'Risk deleted' }, status: :accepted
  end

  private

  def set_risk_register
    @risk_register = RiskRegister.find(params[:risk_register_id])
  end

  def set_risk
    @risk = Risk.find(params[:id])
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
