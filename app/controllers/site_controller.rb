class SiteController < ApplicationController

  skip_before_action :authenticate_user!

  layout "online_mandelbrot", only: :online_view

  def index
    @posts = Post.order("created_at DESC").limit(10)
  end

  def download

  end

  def online_view

  end

end
