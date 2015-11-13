class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params['id'])
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:success] = "Account registered!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def users_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
