class UsersController < ApplicationController

  def index
    render :index
  end

  def new
    render :new
  end

  def create
    user = User.new(user_params)

    if user.valid?
      user.save
      redirect_to user_url(user)
    else
      flash[:errors] = ['User not valid']
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def edit
    @user = User.find_by(id: params[:id])
    render :edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
