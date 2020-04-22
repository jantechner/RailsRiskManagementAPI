class ProjectsController < ApplicationController
  wrap_parameters format: :json

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    @project = Project.find(params[:id])
    if @project
      render json: @project, status: :ok
    else
      render status: :not_found
    end
  end

  def create
    @project = Project.new(params.require(:project).permit(:name, :description, :goal, :start, :deadline, :public))
    if @project.save
      render json: @project, status: :created
    else
      render status: :bad_request
    end
  end

  def update
    logger.debug params
    project = Project.find(params[:id])
    if project
      a = project_params
      logger.debug a
      project.update(project_params)
      logger.debug "updated"
      render json: project, status: :created
    else
      render status: :no_content
    end
  end

  def destroy
    project = Project.find(params[:id])
    if project
      project.destroy
      render json: {status: 'Project deleted'}, status: :accepted
    else
      render status: :no_content
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :goal, :start, :deadline, :public)
  end
end
