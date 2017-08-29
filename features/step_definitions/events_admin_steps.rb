When(/^I access the admin panel as administrator$/) do
  visit '/admin'
  
end

Given(/^I am not logged in as admin user$/) do
  visit '/admin'
  User = nil  
end

Then(/^I should be presented with a login screen$/) do
  expect(page).to have_field 'Password'
  expect(page).to have_button 'Login'
end

Then(/^not have access to the events admin panel$/) do
  visit '/admin/events'
  expect(page).to not_have_content
end

Given(/^I am logged in as admin user$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


Then(/^I will have access to the events admin panel$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

