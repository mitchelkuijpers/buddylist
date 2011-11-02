Then /^I should see comment "([^"]*)"$/ do |comment|
  find("div.comment:first").should have_content comment
end
When /^I post a comment "([^"]*)" on the status update "([^"]*)"$/ do |comment, status_update|
  status_post = first(".status-post")
  status_post.should have_content status_update
  status_post.fill_in 'comment_text', :with => comment
  status_post.click_on 'Add Comment'
end