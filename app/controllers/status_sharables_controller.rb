class StatusSharablesController < ApplicationController

  def view
    sharable = StatusSharable.find params[:sharable_id]

    respond_to do |format|
      format.html { render :locals => { :sharable => sharable } }
      format.json { render :json => person }
    end
  end

  def new

  end

  def create
    person = Person.first

    sharable = StatusSharable.new
    sharable.description = params[:sharable_description]
    person.sharables << sharable
    sharable.save

    redirect_to person_url person
  end

end
