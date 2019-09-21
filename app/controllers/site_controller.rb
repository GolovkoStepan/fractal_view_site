class SiteController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @posts = Post.order("created_at DESC").limit(10)
  end

  def download

  end

end
