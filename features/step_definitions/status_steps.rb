When /^"([^"]*)" has a status update "([^"]*)"$/ do |user_name, description|
  users = User.where name: user_name
  status_post = StatusPost.new description: description
  status_post.created_by  = users.first
  status_post.created_for = users.first
  status_post.save

end

When /^I have a status update$/ do
  Given %{"testing" has a status update "test"}
end

When /^I am om the page of my latest status update$/ do
  latest_status_update = StatusPost.first( sort: [[ :date, :desc]] );
  visit("/status/#{latest_status_update._id}")
  save_and_open_page
end