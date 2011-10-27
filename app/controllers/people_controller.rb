class PeopleController < ApplicationController

  def index
    redirect_to person_url Person.all.first #TODO: Replace with actual homepage
  end

  def search
    people = Person.find_all_by_name /#{params[:person_name]}/i

    respond_to do |format|
      format.html { render locals: { people: people } }
      format.json { render json: people }
    end
  end

  def view
    person = Person.find(params[:person_id])

    respond_to do |format|
      format.html { render locals: { person: person } }
      format.json { render json: person }
    end
  end

  def edit
    # TODO: Edit logged in user's own profile
  end

end