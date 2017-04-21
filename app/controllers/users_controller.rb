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

  def update
    @user = User.find_by(id: params[:id])
    # fail
    if @user
      if @user.update_attributes(user_params)
        redirect_to user_url(@user.id)
      else
        flash[:errors] = ['Invalid parameters']
        redirect_to edit_user_url(@user.id)
      end
    else
      flash[:errors] = ['User does not exist']
      redirect_to new_user_url
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      @user.destroy
      redirect_to users_url
    else
      flash[:errors] = ['Something is not right']
      redirect_to users_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
