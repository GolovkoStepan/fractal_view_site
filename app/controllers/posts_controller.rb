class PostsController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index
    @posts = Post.order(:title).page params[:page]
  end

  def new

  end

  def show

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
