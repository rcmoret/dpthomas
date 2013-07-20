Feature: As a participant in the Foundations events I want to be able to register online

  Background:
    Given there is a future a Walk & Run event

  Scenario: Happy Path
    Given I am on the events page
    When I click on "register for this event"
    Then I should see "Event Registration"
    And I should see "Register for a Walk & Run"
    When I fill in "jessica@example.com" for "Email"
    When I select "1" for "Adults"
    And I select "2" for "Children"
    And I fill in "1 xl; 2 child small" for "Additional info"
    And I press "Register"
    Then I should be on the events page
    And I should see "You have successfully registerd"
