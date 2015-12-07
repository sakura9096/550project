class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.unread
    # debugger
  end

  def destroy
    @notification = current_user.notifications.find(params[:id])
    @notification.destroy
    redirect_to notifications_path 
  end

  def clear
    current_user.notifications.delete_all
    flash[:success] = "All notifications deleted."
    redirect_to root_url
  end


end
