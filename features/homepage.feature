Feature: Homepage
  As an anonymous visitor,
  When I visit the Homepage,
  I should be presented with information about upcoming, running and past events.
  
  Scenario: Anonymous visitors should be presented with general information about
  upcoming events when visiting the homepage.
    Given there is an active event in the database
    When I access the homepage
    Then I should be presented with information about the active event
