class SiteController < ApplicationController

  skip_before_action :authenticate_user!

  def index

  end

  def download

  end

  def author

  end

end
