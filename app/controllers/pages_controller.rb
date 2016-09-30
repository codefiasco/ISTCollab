class PagesController < ApplicationController
  before_action :require_user, only: [:dashboard]
  before_action :current_user, only: [:dashboard]

  def homepage
  end

  def dashboard
  end

end
