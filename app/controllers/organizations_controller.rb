class OrganizationsController < ApplicationController
  before_action :current_user

  def new
    @organization = Organization.new()
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.user = @current_user
    if @organization.save
      redirect_to my_organizations_path()
    else
      render 'new'
    end
  end

  def index
    @organizations = Organization.all()
  end

  def edit
    set_organization
  end

  def update
    set_organization
#     require_same_user
    if @organization.update(organization_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
    set_organization
    session[:organization_id] = @organization.id
  end

  def my_organizations
    current_user
    @myOrganizations = @current_user.organizations
  end

  private
  def organization_params
    params.require(:organization).permit(:title, :description, :interests, :skills)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end

#   def require_same_organization
#     if current_user != @user && !current_user.admin?
#       flash[:danger] = "You can only edit your own accout"
#       redirect_to root_path
#     end
#   end

end
