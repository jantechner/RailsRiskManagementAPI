class ProjectsController < ApplicationController
  wrap_parameters :project
  before_action :set_project, except: %i[index create]

  def index
    render json: Project.all
  end

  def show
    render json: @project
  end

  def create
    @project = Project.create!(project_params)
    render json: @project
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def update
    @project.update!(project_params)
    render json: @project
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def destroy
    @project.destroy
    render status: :no_content
  end

  def risks
    render json: @project
  end

  private

  def set_project
    @project = Project.find(params[:id])
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end

  def project_params
    params.require(:project).permit(
        :name,
        :description,
        :goal,
        :start,
        :deadline,
        :public
    )
  end
end
