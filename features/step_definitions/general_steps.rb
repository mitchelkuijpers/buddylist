Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text), "have not found the text: #{text}"
end
Then /^I should see an error/ do
  page.should have_selector(".error"), "No error message found in the page"
end
Then /^I should not see "([^"]*)"$/ do |text|
  page.should_not have_content(text), "have found the text: #{text}"
end