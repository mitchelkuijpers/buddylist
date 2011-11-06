Given /^I am not authenticated$/ do
  visit('/users/sign_out')
end

Given /^I have one user "([^\"]*)" with password "([^\"]*)" and name "([^\"]*)"$/ do |email, password, name|
  user = User.create! name: name, email: email, password: password, password_confirmation: password
end

Given /^I am logged in as user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  visit('/users/sign_in')
  within("#user_new") do
    fill_in 'user[email]', :with => email
    fill_in 'user[password]', :with => password
  end
  click_on 'Sign in'
  page.should have_content('Signed in successfully.')
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  name = 'testing'

  Given %{I have one user "#{email}" with password "#{password}" and name "#{name}"}
  Given %{I am logged in as user "#{email}" with password "#{password}"}
end

When /^I am the profile page of "([^"]*)"$/ do |user_name|
  user = User.where(name: user_name).first
  visit(user_url user)
  page.should have_content(user_name)
end

When /^I am the profile page of myself$/ do
  Given %{I am on the profile page of "testing"}
end