class UsersController < ApplicationController
  before_action :require_user, except: [:new, :create]

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
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

  def show
    set_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :course, :phone_number,  :email, :interests, :skills,  :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
