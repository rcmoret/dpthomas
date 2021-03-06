Feature: This test will cover addition member profile customization
  Change Password
  Change Email
  Upload Image

  Background:
    Given I am signed in as "ryan@mail.com"

  Scenario: Change Password
    When I click "edit your member profile"
    And I click "change my email or password"
    When I fill in "NeWpAsSwOrD" for "Password"
    And I fill in "NeWpAsSwOrD" for "Password confirmation"
    And I fill in "password" for "Current password"
    And I press "Update"
    Then I should see "You updated your account successfully."
    Then I sign out
    When I go to the sign in page
    And I fill in "ryan@mail.com" for "Email"
    And I fill in "NeWpAsSwOrD" for "Password"
    And I click "Sign In"
    Then I should see "Signed in successfully"

  Scenario: Change Email
    When I click "edit your member profile"
    And I click "change my email or password"
    And I fill in "renee@mail.com" for "Email"
    And I fill in "password" for "Current password"
    And I press "Update"
    Then I should see "You updated your account successfully."
    Then I sign out
    When I go to the sign in page
    And I fill in "renee@mail.com" for "Email"
    And I fill in "password" for "Password"
    And I click "Sign In"
    Then I should see "Signed in successfully"

  Scenario: Add phone number
    When I go to the about the board page
    Then I should not see "Phone"
    When I click "edit your member profile"
    And I fill in "256-534-8451" for "Phone number"
    And I press "Update"
    When I go to the about the board page
    Then I should see "(256) 534-8451"
    When I sign out
    And I go to the about the board page
    Then I should not see "(256) 534-8451"

  Scenario: Private email
    When I click "edit your member profile"
    And I click "change my email or password"
    And I uncheck "Show my email publicly"
    And I fill in "password" for "Current password"
    And I press "Update"
    And I sign out
    And I go to the about the board page
    Then I should not see "ryan@mail.com"
