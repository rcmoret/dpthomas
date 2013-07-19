Feature: I want the board members to be able to keep up with one another via a discussion board

  Background:
    Given I am signed in as "ryan@example.com"

  Scenario: create
    When I go to the members dashboard
    Then I should see "No active discussions"
    When I click "create a new discussion"
    Then I should be on the new discussion page
    When I fill in "Fundraiser" for "Topic"
    And I fill in "details, details" for "Content"
    And I press "Create Discussion"
    Then I should be on the members dashboard
    And I should see "Your discussion was created"
    And I should see "Fundraiser"
    And I should see "posted by: ryan moret"
    When I click "see more >>"
    Then I should see "Topic: Fundraiser"
    And I should see "posted by: ryan moret"
    And I should see "details, details"

  Scenario: edit
    Given I have posted a discussion topic: "Fundraiser", as "ryan@example.com"
    When I go to the members dashboard
    Then I should see "edit discussion"
    When I click "see more >>"
    And I click "edit discussion"
    And I fill in "more specific details" for "Content"
    When I press "Update Discussion"
    Then I should be on the members dashboard
    And I should see "Your discussion was updated"

  Scenario: edit only avaiable to author
    Given I have posted a discussion topic: "Fundraiser", as "ryan@example.com"
    And I sign out
    And I sign in as "julie@example.com"
    When I go to the members dashboard
    Then I should not see "edit discussion"
    When I click "see more >>"
    Then I should not see "edit discussion"
