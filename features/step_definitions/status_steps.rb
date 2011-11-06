When /^"([^"]*)" has a status update "([^"]*)"$/ do |user_name, description|
  user = User.where(name: user_name).first
  StatusPost.create description: description, users: [user, user]
end

When /^I have a status update$/ do
  Given %{"testing" has a status update "test"}
end

When /^I am om the page of my latest status update$/ do
  latest_status_update = StatusPost.first( sort: [[ :date, :desc]] );
  visit("/status/#{latest_status_update._id}")
end