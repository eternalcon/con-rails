Given(/^I am not logged in as admin user$/) do
  user = nil  
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


Given(/^I am logged in as admin user$/) do
  user = create(:admin_user)
  visit '/admin/login'
  fill_in "Email", :with => user.email
  fill_in "Password", :with => user.password
  click_button "Login"
end

When(/^I access the admin panel$/) do
  visit '/admin'
end

Then(/^I should have access to the active admin dashboard$/) do
  expect(page.title).to have_content 'Dashboard'
end

Then(/^I should have access to the Events admin panel$/) do
  expect(page).to have_content 'Events'
end

