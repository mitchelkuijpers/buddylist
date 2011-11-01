Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text), "have not found the text: #{text}"
end
Then /^I should see a warning/ do
  page.should have_selector(".message.warning"), "No warning message found in the page"
end
Then /^I should not see "([^"]*)"$/ do |text|
  page.should_not have_content(text), "have found the text: #{text}"
end