class InterestsController < ApplicationController
  before_action :current_user

  def create
     interest = Interest.new()
     interest.user = @current_user
     interest.project = Project.find(session[:project_id])
  end

end