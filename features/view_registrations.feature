Feature: As a board member I want to be able to view the individuals who have registered for an event

  Background:
    Given there is a future a Walk & Run event
    And "bill@mail.com" has registered for this event with 2 children and 1 adult

  Scenario:
    Given I am signed in as "ryancmoret@example.com"
    And I am on the members dashboard
    When I click on "View registered participants for this event"
    Then I should see "bill@mail.com"
    And I should see "2"
    And I should see "1"
