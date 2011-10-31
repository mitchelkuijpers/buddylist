module PersonHelper

  def link_to_person person
    link_to person.name, person_url(person), class: "person-link"
  end

  def link_to_author person
    link_to person.name, person_url(person), class: ["person-link", "author"]
  end

end