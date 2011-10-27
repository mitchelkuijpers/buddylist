class PeopleController < ApplicationController

  def index
    render nothing: true
  end

  def view
    person = Person.find(params[:person_id])

    respond_to do |format|
      format.html { render :locals => { :person => person} }
      format.json { render :json => person }
    end
  end

  def edit
    # TODO: Edit logged in user's own profile
  end

end