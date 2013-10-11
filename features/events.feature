Feature: Members need to add and update events

  Background:
    Given I am signed in as "ryancmoret@example.com"

  Scenario: New Event
    When I click "Add a new event"
    Then I should be on the new event page
    When I fill in "Fundraiser" for "Title"
    And I fill in "2nd Annual walk and run" for "Name"
    And I fill in "Sat Mar 08 2014" for "Date"
    And I fill in "Shelby Bottoms" for "Location"
    And I fill in "Walk run" for "Details"
    And I press "Create Event"
    Then I should be on the members dashboard
    And I should see "2nd Annual walk and run"
    And I should not see "No scheduled future events"
    When I go to the events page
    Then I should see "2nd Annual walk and run"
    And I should not see "No scheduled future events"
    And I should see "No past events"

  Scenario: New Event; date in past
    When I click "Add a new event"
    Then I should be on the new event page
    When I fill in "Fundraiser" for "Title"
    And I fill in "2nd Annual walk and run" for "Name"
    And I fill in "Sat Mar 08 2012" for "Date"
    And I fill in "Shelby Bottoms" for "Location"
    And I fill in "Walk run" for "Details"
    And I press "Create Event"
    Then I should be on the members dashboard
    And I should not see "2nd Annual walk and run"
    And I should see "No scheduled future events"
    When I go to the events page
    Then I should not see "Fundraiser"
    And I should see "There are no future events scheduled"

  Scenario: New Event; requires registration
    Given I am on the new event page
    And I fill in "Fundraising" for "Title"
    And I fill in "2nd Annual walk and run" for "Name"
    And I fill in "Shelby Bottoms" for "Location"
    And I fill in "Walk run" for "Details"
    And I fill in "Sat Mar 08 2015" for "Date"
    And I check "Registration required?"
    And I press "Create Event"
    Then I should be on the members dashboard

  Scenario: Edit event
    Given there is a future a Walk & Run event
    When I go to the events page
    And I click on "edit this event"
    And I fill in "New Name" for "Name"
    And I press "Update Event"
    Then I should be on the events page
    And I should see "New Name"

  Scenario: Show event after event date
    Given there is a past fundraising event
    And I am on the members dashboard
    When I click "View all events"
    Then I should not see "fundraising"
    When I click "View all past events"
    Then I should see "fundraising"
    And I press "edit this event"
    And I check "Display event after the event's date"
    And I press "Update Event"
    And I go to the events page
    Then I should see "fundraising"
