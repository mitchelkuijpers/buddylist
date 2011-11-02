class PeopleController < ApplicationController
  before_filter :authenticate_user!

  def index
    redirect_to person_url Person.all.first #TODO: Replace with actual homepage
  end

  def search
    # TODO: Make security less strict
    person_name = params[:person_name] || ''

    people = Person.search_by_name person_name

    respond_to do |format|
      format.html { render locals: { people: people, searchterm: person_name } }
      format.json { render json: people }
    end
  end

  def view
    person = Person.find params[:person_id]

#    authorize! :view, person

    respond_to do |format|
      format.html { render locals: { person: person } }
      format.json { render json: person }
    end
  end

  def edit
    # TODO: Edit logged in user's own profile
  end

end