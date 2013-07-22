Feature: As a participant in the Foundations events I want to be able to register online

  Background:
    Given there is a future a Walk & Run event

  @javascript
  Scenario: Happy Path
    Given I am on the events page
    When I click on "register for this event"
    Then I should see "Event Registration"
    And I should see "Register for a Walk & Run"
    When I fill in "jessica@example.com" for "Email"
    When I select "1" for "Adults"
    And I select "2" for "Children"
    And I fill in "1 large; 2 child small" for "Additional info"
    Then I should see "registration fee ($50)"
    And I press "Continue >>"
    Then I should see "Step 2 of 2 (review and payment)"
    And I should see "donate the $50 registration fee using PayPal"
    When I click "Click here"
    Then I should see "Event Registration"
    When I select "2" for "Adults"
    And I press "Continue >>"
    And I should see "donate the $80 registration fee using PayPal"
