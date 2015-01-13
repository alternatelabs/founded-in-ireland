class PostsController < ApplicationController

  def index
    @posts = Post.published
  end

  def show
    @post = Post.get_by_slug(params[:slug])
    raise ActionController::RoutingError.new('Not Found') unless @post
  end

end