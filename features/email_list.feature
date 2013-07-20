Feature: A visitor signs up for the email list

  Scenario: User Signs Up for the email list (happy path)
    Given I am on the home page
    And I click "email newsletter"
    Then I should be on the email list sign up page
    When I fill in "crystal" for "First name"
    And I fill in "robinson" for "Last name"
    And I press "Sign up"
    Then I should be on the home page
    And I should see "thanks for signing up for the mailing list"
