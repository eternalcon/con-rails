Feature: Events Admin
  As an Events Administrator,
  When I visit the Administration Panel,
  I want to be able to administrate events.
  
  Scenario: Only Administrators will have access to the events admin panel
    When I access the admin panel as administrator
    Given I am not logged in as admin user
    Then I should be presented with a login screen
    And not have access to the events admin panel
    Given I am logged in as admin user
    Then I will have access to the events admin panel
    
    
