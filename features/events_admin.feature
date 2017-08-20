Feature: Events Admin
  As an Events Administrator,
  When I visit the Administration Panel,
  I want to be able to administrate events.
  
  Scenario: Administrators will have access to the events admin panel
    When I access the admin panel as administrator
    Then I will have access to the events admin panel
