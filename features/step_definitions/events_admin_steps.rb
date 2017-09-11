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
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => user.password
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

When(/^I access the events admin panel$/) do
  visit '/admin/events'
end

Then(/^I should see the option to create a new event$/) do
  expect(page).to have_link 'New Event'
end

When(/^I visit the new event page$/) do
  visit '/admin/events/new'
end

Then(/^I should be able to create a new event$/) do
  expect(page).to have_content 'New Event'
  event_attr = attributes_for(:event)
  fill_in 'Name', :with => event_attr[:name]
  select(event_attr[:start_date].year.to_s, :from => "event_start_date_1i")
  select(event_attr[:start_date].strftime("%B"), :from => "event_start_date_2i")
  select(event_attr[:start_date].mday.to_s, :from => "event_start_date_3i")    
  select(event_attr[:end_date].year.to_s, :from => "event_end_date_1i")
  select(event_attr[:end_date].strftime("%B"), :from => "event_end_date_2i")
  select(event_attr[:end_date].mday.to_s, :from => "event_end_date_3i")  
  click_button "Create Event"
  expect(page).to have_content 'Event was successfully created'
end

