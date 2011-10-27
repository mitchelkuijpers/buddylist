class PeopleController < ApplicationController

  def index
    redirect_to person_url Person.all.first #TODO: Replace with actual homepage
  end

  def search
    # TODO: Make security less strict
    searchterm = params[:person_name] || ''
    searchterm.sub /[^a-z]/i, ''

    people = []
    unless searchterm.blank?
      people = Person.find_all_by_name /#{searchterm}/i
    end

    respond_to do |format|
      format.html { render locals: { people: people, searchterm: searchterm } }
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