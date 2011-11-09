class NotificationsController < ApplicationController
  before_filter :authenticate_user!

  after_filter :update_read_status


  # Show list of notifications
  def index
    notifications = current_user.notifications
    unread_notifications = current_user.unread_notifications.size

    respond_to do |format|
      format.html { render locals: { notifications: notifications, unread_notifications: unread_notifications }}
    end
  end

  def destroy
    current_user.notifications.destroy_all

    redirect_to :notifications
  end

  private

  def update_read_status
    current_user.notifications.update_all(
            read_status: true
    )
  end
end
