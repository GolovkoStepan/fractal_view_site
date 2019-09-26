class NotificationsController < ApplicationController

  def read
    @notification = Notification.find(params[:id])

    if @notification.subject.present?
      @notification.read!
    else
      @notification.destroy
    end

    redirect_to account_notifications_path
  end


  def read_all
    Notification.where(user: current_user).unread.each(&:read!)

    redirect_to account_notifications_path
  end

end
