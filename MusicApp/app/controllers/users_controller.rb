class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      log_in_user!(@user)
      #redirect later
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def new
    @user = User.new
    #render later
  end

  def show
    debugger
    user = User.find(params[:id])
    render json: user
  end

  # def update
  #   user = User.find_by_credentials(params[:user][:email], params[:user][:password])
  #
  #   if user
  #     user.save!
  #   end
  # end
  #
  # def destroy
  #
  # end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
