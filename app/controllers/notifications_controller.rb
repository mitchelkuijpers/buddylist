class NotificationsController < ApplicationController
  before_filter :authenticate_user!


  # Show list of notifications
  def index
    notifications = current_user.notifications

    update_read_status

    respond_to do |format|
      format.html { render locals: { notifications: notifications }}
    end
  end

  def sort_by
    type = params[:type_notification]

    render json: type
  end


  private

  def update_read_status
    current_user.notifications.update_all(
            read_status: true
    )
  end
end
