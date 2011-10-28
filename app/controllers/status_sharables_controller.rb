class StatusSharablesController < ApplicationController
  before_filter :authenticate_user!

  def view
    sharable = StatusSharable.find params[:sharable_id]

    respond_to do |format|
      format.html { render :locals => { :sharable => sharable } }
      format.json { render :json => sharable }
    end
  end

  def new

  end

  def create
    person = current_user.person
    wall = Wall.find params[:wall_id]
    sharable = StatusSharable.create description: params[:sharable_description], person: person, wall: wall

    redirect_to status_sharable_url sharable
  end

end