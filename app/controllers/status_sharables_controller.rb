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
    return render json: person.methods
    sharable = StatusSharable.new
    sharable.description = params[:sharable_description]
    person.sharables << sharable
    sharable.save

    redirect_to person_url person
  end

end
