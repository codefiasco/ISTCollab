class ProjectsController < ApplicationController
  def new
    @project = Project.new()
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to dashboard_path()
    else
      render 'new'
    end
  end

  def index
    @projects = Project.all()
  end

  def edit
    set_project
  end

  def show
    set_project
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :skills, :category)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end