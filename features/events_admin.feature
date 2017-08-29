Feature: Events Admin
  As an Events Administrator,
  When I visit the Administration Panel,
  I want to be able to administrate events.
  
  Scenario: Regular users should not have access to the admin panel or sub-panels
    Given I am not logged in as admin user
    When I access the admin panel as regular user
    Then I should be presented with a login screen
    When I try to access the events admin panel as regular user directly
    Then I should be redirected to the login screen
