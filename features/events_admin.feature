Feature: Events Admin
  As an Events Administrator,
  When I visit the Administration Panel,
  I want to be able to administrate events.
  
  Background: Given I am logged in as an administrator
    
  Scenario: Administrators will have access to the event admin panel
    When I access the event admin panel
    Then I will have access to the "Create new Event" option
    
  
