class Like

  include Mongoid::Document

  # Associations
  belongs_to :likable, polymorphic: true
  belongs_to :person


  def self.by_person person
    where person_id: person.id
  end

end