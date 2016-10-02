class ProjectsController < ApplicationController
  before_action :current_user
  def new
    @project = Project.new()
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
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
#     session[:project_id] = @project.id
  end

  def my_projects
    current_user
    @myProjects = @current_user.projects
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :skills, :category)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end
