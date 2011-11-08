class NotificationsController < ApplicationController
  before_filter :authenticate_user!


  # Show list of notifications
  def index
    notifications = current_user.notifications
    unread_notifications = current_user.unread_notifications.size

    #update_read_status

    respond_to do |format|
      format.html { render locals: { notifications: notifications, unread_notifications: unread_notifications }}
    end
  end

  private

  def update_read_status
    current_user.notifications.update_all(
            read_status: true
    )
  end
end
