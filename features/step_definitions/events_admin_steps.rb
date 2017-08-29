Given(/^I am not logged in as admin user$/) do
  User = nil  
end

When(/^I access the admin panel as regular user$/) do
  visit '/admin'
end

Then(/^I should be presented with a login screen$/) do
  expect(page).to have_field 'Password'
  expect(page).to have_button 'Login'
end

When(/^I try to access the events admin panel as regular user directly$/) do
  visit '/admin/events'
end

Then(/^I should be redirected to the login screen$/) do
  expect(page).to have_field 'Password'
  expect(page).to have_button 'Login'
end

