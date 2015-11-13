class PostsController < ApplicationController
  def index
    render template: "posts/index.html.erb"
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Your Post Was a Success!"
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @posts = Post.all
    #if current_user_session
    @post = Post.new
end
def edit
  @posts = Post.all
  @post = Post.find(params[:id])
  @post.save
  render :new
end

def update
   @post = Post.find(params[:id])
   if @post.update(post_params)
     redirect_to @post
   else
     render partial: "post/new", layout: "application"
   end
   @post.save
 end

def show
    @posts = Post.find(params[:id])
    render :index
    @posts.save
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    Post.all
    redirect_to root_path
    @post.save

  end

end
