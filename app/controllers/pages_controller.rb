class PagesController < ApplicationController
  before_action :require_user, only: [:dashboard]
  before_action :current_user, only: [:dashboard]

  def homepage
    redirect_to  dashboard_path if logged_in?
  end

  def dashboard
    @latest_projects = Project.last(3)
    @latest_events = Event.last(3)
  end

end
