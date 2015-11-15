class UserSessionsController < ApplicationController


  def new
    @user_session = UserSession.new
  end
  def index
    if current_user_session
      @posts = Post.select("posts.*").where("user_id = " + current_user.id.to_s).order(:created_at).page(params[:page]).per(50)
    else
      @posts = Post.select("posts.*").order(:created_at).page(params[:page]).per(50)
    end
  end
  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:success] = "Welcome back!"
      redirect_to root_path
    else
      render :new
    end
  end
  def follow
    user1 = current_user
    user2 = User.find(params['id'])
    user1.follow(user2)
    redirect_to :back
  end

  def destroy
      current_user_session.destroy
      flash[:success] = "Goodbye!"
      redirect_to root_path
  end



  private

  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end
