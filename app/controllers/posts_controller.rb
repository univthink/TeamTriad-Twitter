class PostsController < ApplicationController
  def index
    render template: "posts/index.html.erb"
  end


  def new
    @posts = Post.all
    #if current_user_session
    @post = Post.new
    render template: "posts/new"


end
end
