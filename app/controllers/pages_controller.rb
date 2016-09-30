class PagesController < ApplicationController
  before_action :require_user, only: [:dashboard]
  before_action :current_user, only: [:dashboard]

  def homepage
    render 'dashboard' if logged_in?
  end

  def dashboard
  end

end
