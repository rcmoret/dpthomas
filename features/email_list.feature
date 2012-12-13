Feature: A visitor signs up for the email list

  Background:
    Given I am on the home page
    And I click on "email list"
    Then I should see the title "DP Thomas: Join the Email List"

  Scenario: User Signs Up for the email list (happy path)
    When I fill in "test@example.com" for "Email address"
    And I fill in "L. G." for "First name"
    And I fill in "Montgomery" for "Last name"
    And I click "Sign Up"
    Then I should be on the home page
    And I should see "You successfully signed up for the email list."
    When I go to the email list page
    Then I should see "test@example.com"
    And I should see "L. G. Montgomery"

  Scenario: User Signs Up without some information
    When I fill in "" for "Email address"
    And I click "Sign Up"
    Then I should see "Your sign up was unsuccessful; please check your information and try again."
