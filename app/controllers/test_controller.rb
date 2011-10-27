class TestController < ApplicationController

  def create
    # Create a new people
    person = Person.new
    person.name= "Teun van Vegchel"
    person.email= "teun@vanvegchel.net"
    person.password= "test password 123"
    person.save

    # Create a new status update, and add it to the people
    update = StatusSharable.new(:description => "DOET HEUL STOER")
    person.sharables << update
    person.save

    vid = VideoSharable.new(:description => "Harde Purno")
    person.sharables << vid
    person.save



    # Add a comment to the previously created status update
    comment = Comment.new(:text => "Dikke shit man!")
    comment.person= person
    update.comments << comment
    update.save

    respond_to do |format|
      format.all { render :json => person }
    end
  end

  def read
    # Retrieve persons named "Teun van Vegchel" from the database and give us the most recent one
    data = Sharable.all
    #persons = Person.find_all_by_name "Teun van Vegchel"
    #
    #data = []
    #for people in persons
    #  data << people.sharables
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