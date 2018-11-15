class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if user
      log_in_user!(user)
      render :show
    else
      render json: "Username/password combination doesn't exist"
    end
  end

  def new
    @user = User.new
    render :new
  end

  def delete
    log_out_user!
    #add redirect
  end

end
