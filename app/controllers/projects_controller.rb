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
    @interests = @project.interests
    if @interests
      @interests = @interests.split(',')
      @people = []
      @interests.each do |user|
        @people << User.find(user.to_i)
      end
    end
    session[:project_id] = @project.id
  end

  def my_projects
    current_user
    @myProjects = @current_user.projects
  end

  def interest
    project = Project.find(session[:project_id])
    unless project.interests
      project.interests = @current_user.id.to_s
    else

      project.interests += ',' + @current_user.id.to_s
    end

    project.save
    redirect_to project_path(project)
  end

  def uninterest
    project = Project.find(session[:project_id])
    interests = project.interests
    interests = interests.split(',')
    interests = interests.map(&:to_i)
    interests.delete(current_user.id)
    interests = interests.map(&:to_s)
    interests = interests.join(',')
    project.interests = interests
    project.interests = nil unless project.interests.length > 0
    project.save
    redirect_to project_path(project)
  end

  def destroy
    project = Project.find(set_project)
    project.destroy
    redirect_to projects_path()
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :skills, :category, :avatar)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end
