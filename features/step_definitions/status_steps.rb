When /^"([^"]*)" has a status update "([^"]*)"$/ do |person_name, description|
  person = Person.where name: person_name
  StatusPost.create description: description, persons: person
end