class RelationsController < ActionController::Base

  def test
    p1 = Person.new :name => "Teun"
    p2 = Person.new :name => "Henk"

    r = Relation.new(:status => 123)
    r.person_1= p1
    r.person_2= p2

    p1.save
    p2.save
    r.save

    respond_to do |format|
      format.all { render :json => r }
    end
  end

  def index
    persons = Person.all
    data = []

    for person in persons
      rs = person.relations
      for r in rs
        if r.instance_of? Relation
          data << [r.person_1, r.person_2]
        end
      end
    end

    respond_to do |format|
      format.all { render :json => [data] }
    end
  end

  def propose person
    person = Person.find person

    relation = Relation.new me, person
    relation.save
  end

  def accept relation
    relation = Relation.find relation
    relation.accept # TODO check if the user is allowed to accept the relation
  end

  def deny relation
    relation = Relation.find relation
    relation.deny # TODO check if the user is allowed to deny the relation
  end

end