Feature: This test will cover addition member profile customization
  Change Password
  Change Email
  Upload Image

  Background:
    Given I am signed in as "ryan@example.com"

  Scenario: Change Password
    When I click "edit your profile"
    And I click "change my password"
    When I fill in "NeWpAsSwOrD" for "Password"
    And I fill in "NeWpAsSwOrD" for "Password confirmation"
    And I fill in "password" for "Current password"
    And I press "Update"
    Then I should see "You updated your account successfully."
