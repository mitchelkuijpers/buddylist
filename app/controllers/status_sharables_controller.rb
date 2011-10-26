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

end
