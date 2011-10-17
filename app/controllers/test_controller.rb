class TestController < ActionController::Base

  def create
    # Create a new person
    person = Person.new(:name => "Teun van Vegchel")
    person.save

    # Create a new status update, and add it to the person
    update = StatusSharable.new(:description => "DOET HEUL STOER")
    update.save
    person.sharables << update

    # Add a comment to the previously created status update
    comment = Comment.new(:text => "Dikke shit man!")
    update.comments << comment
    comment.save

    respond_to do |format|
      format.all { render :json => [person, person.sharables] }
    end
  end

  def read
    # Retrieve persons named "Teun van Vegchel" from the database and give us the most recent one
    data = Sharable.all
    #persons = Person.find_all_by_name "Teun van Vegchel"
    #
    #data = []
    #for person in persons
    #  data << person.sharables
    #end

    respond_to do |format|
      format.all { render :json => [data.first.comments] }
    end
  end

  def update

  end

  def delete

  end

end