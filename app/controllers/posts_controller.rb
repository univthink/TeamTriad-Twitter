class PostsController < ApplicationController
  def new
    @posts = Post.all
    if current_user_session
    @post = Post.new
    render partial: "post/new", layout: "application"
  else
    render partial: "post/error", layout: "error"
  end

end
