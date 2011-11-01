When /^"([^"]*)" has a status update "([^"]*)"$/ do |person_name, description|
  person = Person.where name: person_name
  StatusPost.create description: description, persons: [person, person]
end

When /^I have a status update$/ do
  Given %{"testing" has a status update "test"}
end

When /^I am om the page of my latest status update$/ do
  latest_status_update = StatusPost.first( sort: [[ :date, :desc]] );
  visit("/status/#{latest_status_update._id}")
end