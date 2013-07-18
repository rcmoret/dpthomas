Feature: Members need to add and update events

  Background:
    Given I am signed in as "ryancmoret@example.com"

  Scenario: New Event
    When I click "Add a new event"
    Then I should be on the new event page
    When I fill in "Fundraiser" for "Title"
    And I fill in "Sat Mar 08 2014" for "Date"
    And I fill in "Shelby Bottoms" for "Location"
    And I fill in "Walk run" for "Details"
    And I press "Create Event"
    Then I should be on the members dashboard
    And I should see "Fundraiser"
    And I should not see "No scheduled events"
    When I go to the events page
    And I should see "Fundraiser"
    And I should not see "No scheduled events"

  Scenario: New Event; date in past
    When I click "Add a new event"
    Then I should be on the new event page
    When I fill in "Fundraiser" for "Title"
    And I fill in "Sat Mar 08 2012" for "Date"
    And I fill in "Shelby Bottoms" for "Location"
    And I fill in "Walk run" for "Details"
    And I press "Create Event"
    Then I should be on the members dashboard
    And I should not see "Fundraiser"
    And I should see "No scheduled events"
    When I go to the events page
    Then I should not see "Fundraiser"
    And I should see "No scheduled events"
