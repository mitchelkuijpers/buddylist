class NotificationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    notifications = Notification.where(person_id: current_user.person.id)

    return render json: notifications
  end

  def create
    notification = Notification.new
    notification.message = "Testing notification"
    notification.person  = current_user.person
    notification.save!

    return render json: notification
  end
end