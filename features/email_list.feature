Feature: A visitor signs up for the email list

  Scenario: User Signs Up for the email list (happy path)
    Given I am on the home page
    And I click on "email list"
    Then I should see the title "DP Thomas: Join the Email List"
    When I fill in "test@example.com" for "Email address"
    And I fill in "L. G." for "First name"
    And I fill in "Montgomery" for "Last name"
    And I click "Sign Up"
    Then I should be on the home page
    And I should see "You successfully signed up for the email list."
