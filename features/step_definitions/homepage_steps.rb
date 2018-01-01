Given(/^there is an active event in the database$/) do
  @event = create(:event)
end

When(/^I access the homepage$/) do
  visit '/'
end

Then(/^I should be presented with information about the active event$/) do
  expect(page.title).to have_content @event.name
end

