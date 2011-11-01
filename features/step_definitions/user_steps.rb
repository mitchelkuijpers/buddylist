Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one user "([^\"]*)" with password "([^\"]*)" and name "([^\"]*)"$/ do |email, password, name|
  user = User.create! email: email, password: password, password_confirmation: password
  user.person = Person.create! name: name
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

When /^I am the profile page of "([^"]*)"$/ do |person_name|
  person = Person.where name: person_name
  visit("person/#{person[0]._id}")
  page.should have_content(person_name)
end