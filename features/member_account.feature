Feature: Members need to be able to sign up and sign in.

  Scenario: Sign in: incomplete profile
    Given I am a member; my email is "ryan@mail.com"
    And I am on the sign in page
    And I fill in "ryan@mail.com" for "Email"
    And I fill in "password" for "Password"
    And I click "Sign In"
    Then I should be on my member profile page
    When I go to the about the board page
    Then I should not see "email: ryan@mail.com"

  Scenario: Sign in: completed profile
    Given I am a member; my email is "ryan@mail.com"; my profile is complete
    And I am on the sign in page
    And I fill in "ryan@mail.com" for "Email"
    And I fill in "password" for "Password"
    And I click "Sign In"
    Then I should be on the members dashboard
    When I go to the about the board page
    Then I should see "ryan@mail.com"

  Scenario: Sign out
    Given I am signed in as "ryancmoret@example.com"
    When I click "sign out"
    Then I should be on the home page
    And I should see "Signed out successfully"
    When I go to the about the board page
    Then I should not see "edit your profile"

  Scenario: Edit profile from Foundation Board page
    Given I am signed in as "ryancmoret@mail.com"
    When I go to the about the board page
    And I click "edit your profile"
    Then I should be on my member profile page
    When I fill in "Web consultant" for "Position"
    And I press "Update your profile"
    Then I should be on the about the board page
    And I should see "You successfully updated your profile"
    And I should see "Web consultant"
