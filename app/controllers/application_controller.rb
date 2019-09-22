class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  helper_method :current_controller?

  def current_controller?(names)
    names.include?(params[:controller]) unless params[:controller].blank? || false
  end

end
