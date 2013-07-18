Feature: Members need to be able to sign up and sign in.

  Scenario: Sign up: happy path
    Given I am on the member sign up page
    When I fill in "ryan@example.com" for "Email"
    And I fill in "password" for "Password"
    And I fill in "password" for "Password confirmation"
    And I press "Sign Up"
    Then I should be on my member profile page
    When I fill in "Ryan" for "First name"
    And I fill in "Moret" for "Last name"
    And I fill in "Web consultant" for "Position"
    And I fill in "A bunch of deets" for "Biography"
    And I press "Update your profile"
    Then I should be on the members dashboard

  Scenario: Sign up: incomplete profile
    Given I am a member; my email is "ryan@example.com"
    And I am on the sign in page
    And I fill in "ryan@example.com" for "Email"
    And I fill in "password" for "Password"
    And I click "Sign In"
    Then I should be on my member profile page
    When I go to the about the board page
    Then I should not see "ryan@example.com"

  Scenario: Sign in: completed profile
    Given I am a member; my email is "ryan@example.com"; my profile is complete
    And I am on the sign in page
    And I fill in "ryan@example.com" for "Email"
    And I fill in "password" for "Password"
    And I click "Sign In"
    Then I should be on the members dashboard
    When I go to the about the board page
    Then I should see "ryan@example.com"
