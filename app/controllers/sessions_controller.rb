class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:name], params[:user][:password])

    if @user
      session[:session_token] = @user.session_token
      redirect_to users_url
    else
      flash[:errors] = ['Invalid username/password']
      redirect_to new_session_url
    end
  end

  def destroy
  end

end
