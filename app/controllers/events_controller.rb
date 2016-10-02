class EventsController < ApplicationController
  before_action :current_user

  def new
    @event = Event.new()
    @categories = Category.all()
  end

  def create
    @event = Event.new(event_params)
    @event.organization = Organization.find(session[:organization_id])
    if @event.save
      redirect_to organization_path()
    else
      redirect_to new_event_path()
    end
  end

  def index
    @events = Event.all()
  end

  def edit
    set_event
  end

  def show
    set_event
  end

  def my_projects
    current_user
    @myProjects = @current_user.projects
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :skills, :category)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
