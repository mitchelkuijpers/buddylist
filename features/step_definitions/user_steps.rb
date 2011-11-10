Given /^I am not authenticated$/ do
  visit('/users/sign_out')
end

Given /^I have one user "([^\"]*)" with password "([^\"]*)" and name "([^\"]*)"$/ do |email, password, name|
  user = User.new email: email, password: password, password_confirmation: password, name: name
  user.save
end

Given /^I am logged in as user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  visit('/users/sign_in')
  within("#user_new") do
    fill_in 'user[email]', :with => email
    fill_in 'user[password]', :with => password
  end
  click_on 'Sign in'
  page.should have_content('Edit profile')
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  name = 'testing'

  Given %{I have one user "#{email}" with password "#{password}" and name "#{name}"}
  Given %{I am logged in as user "#{email}" with password "#{password}"}
end

When /^I am the profile page of "([^"]*)"$/ do |user_name|
  user = User.where name: user_name
  visit("/users/#{user[0]._id}")
  page.should have_content(user_name)
end

When /^I am the profile page of myself$/ do
  Given %{I am on the profile page of "testing"}
end

When /^I am friends with "([^"]*)"$/ do |user_name|
  user   = User.where name: 'testing'
  friend = User.where name: user_name

  relation = Relationship.find_or_create_for_users user.first, friend.first

  role = relation.find_or_create_role :friends
  role.status = [RelationshipRole::STATUS_ACCEPTED, RelationshipRole::STATUS_ACCEPTED]
  role.save
end