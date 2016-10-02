class UsersController < ApplicationController
  before_action :require_user, except: [:new, :create]

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path()
    else
      render 'new'
    end
  end

  def index
    @users = User.all()
  end

  def edit
    set_user
  end

  def update
    set_user
    require_same_user
    params = user_params
    params[:skills] = params[:skills].split(",")
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
    set_user
    @skills = @user.skills.split(',') if @user.skills
    @interests = @user.interests.split(',') if @user.interests
  end

  private
  def user_params
    params.require(:user).permit(:name, :course, :phone_number,  :email, :interests, :skills,  :password, :avatar, :skills, :github_link, :linkedin_link, :interests)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:danger] = "You can only edit your own accout"
      redirect_to root_path
    end
  end

end
