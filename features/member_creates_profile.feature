Feature: Member Creates a Profile

  Scenario: Member Creates a Profile
    Given I am on the create member profile page
    And I fill in "Ryan" for "Name"
    And I fill in "Web Consultant" for "Title"
    And I fill in "Details" for "Profile"
    And I fill in "ryan@example.com" for "Email"
    When I click "Create Profile"
    Then I should be on the home page
    And I should see "Your profile was successfully created."
