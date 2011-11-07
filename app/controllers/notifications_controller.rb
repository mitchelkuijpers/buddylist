class NotificationsController < ApplicationController
  before_filter :authenticate_user!


  # Show list of notifications
  def index
    notifications = current_user.notifications

    respond_to do |format|
      format.html { render locals: { notifications: notifications }}
    end
  end

  def sort_by
    type = params[:type_notification]

    return render json: type
  end

end
