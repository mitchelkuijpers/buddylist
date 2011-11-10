Then /^I should see comment "([^"]*)"$/ do |comment|
  save_and_open_page
  first('.reactions').should have_content comment
end

When /^I post a comment "([^"]*)" on the status update "([^"]*)"$/ do |comment, status_update|
  status_post = first(".status-post")
  status_post.should have_content status_update
  status_post.fill_in 'comment_message', :with => comment
  status_post.click_on 'Add Comment'
end