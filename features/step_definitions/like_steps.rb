When /^I click "([^"]*)" in my latest status update$/ do |button_value|
  find(".status-post .menu").click_on button_value
end
When /^I like my latest status update$/ do
  pending
end