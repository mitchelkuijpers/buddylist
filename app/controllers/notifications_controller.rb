class NotificationsController < ApplicationController
  before_filter :authenticate_user!


  def index
    notifications = Notification.where person_id: current_user.id

    render json: notifications
  end


  def create
    notification = Notification.create! message: "Testing notification", user: current_user

    render json: notification
  end


end