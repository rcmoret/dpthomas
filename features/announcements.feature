Feature: As a board member I want to be able to add announcements to the site

  Background:
    Given I am signed in as "ryancmoret@mail.com"

  Scenario: Happy Path
    Given I am on the members dashboard
    When I click "Create a new site announcement"
    Then I should be on the new announcement page
    When I fill in "Hey y'all check out this new announcement" for "Announcement"
    And I click "Create Announcement"
    And I go to the home page
    Then I should see "Hey y'all check out this new announcement"

  Scenario: view index w/o announcements is redirected to new
    When I go to the members dashboard
    Then I should not see "View all site announcements"
    And I should see "There are currently no site announcements"
    When I go to the announcement list page
    Then I should be on the new announcement page
    And I should see "There are currently no site announcements. Would you like to create one?"

  Scenario: View index; edit announcement
    Given there is an announcment about "the new improved website"
    And I am on the members dashboard
    When I click "View all site announcements"
    Then I should be on the announcement list page
    And I should see "the new improved website"
    When I click "edit this site announcement"
    And I fill in "ok so maybe not so improved" for "Announcement"
    And I click "Update Announcement"
    And I go to the home page
    Then I should see "ok so maybe not so improved"

  Scenario: Delete announcment
    Given there is an announcment about "the new improved website"
    And I am on the members dashboard
    When I click "View all site announcements"
    And I click on "delete this site announcement"
    Then I should be on the members dashboard
    And I should not see "the new improved website"
    And I should see "You have deleted a site announcement"
