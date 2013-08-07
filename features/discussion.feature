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
    And I should see "posted by ryan moret"
    When I click "see more"
    Then I should see "Topic: Fundraiser"
    And I should see "posted by ryan moret"
    And I should see "details, details"

  Scenario: edit
    Given I have posted a discussion topic: "Fundraiser", as "ryan@example.com"
    When I go to the members dashboard
    Then I should see "edit discussion"
    When I click "see more"
    And I click "edit discussion"
    And I fill in "more specific details" for "Content"
    When I press "Update Discussion"
    Then I should be on the members dashboard
    And I should see "Your discussion was updated"

  Scenario: index and pagination
    Given there were 12 discussions posted earlier this week
    And I have posted a discussion topic: "Pagination", as "ryan@example.com"
    And I am on the members dashboard
    When I click "View all discussions"
    Then I should be on the main discussion page
    Then I should see "Pagination"
    And I should see "posted by ryan moret"
    And I should see "Next"
    And I should see "Last"
    When I click "Next"
    Then I should not see "Pagination"
    And I should see "posted by candace@example.com"

  Scenario: edit only avaiable to author
    Given I have posted a discussion topic: "Fundraiser", as "ryan@example.com"
    And I sign out
    And I sign in as "julie@example.com"
    When I go to the members dashboard
    Then I should not see "edit discussion"
    When I click "see more"
    Then I should not see "edit discussion"

  Scenario: delete, from discussion index
    Given I have posted a discussion topic: "Fundraiser", as "ryan@example.com"
    When I go to the main discussion page
    And I click "remove this discussion"
    Then I should be on the members dashboard
    And I should see "Discussion was removed"

  Scenario: delete, from member dashboard
    Given I have posted a discussion topic: "Fundraiser", as "ryan@example.com"
    And I am on the members dashboard
    And I click "remove this discussion"
    Then I should be on the members dashboard
    And I should see "Discussion was removed"

  Scenario: delete available to author only
    Given I have posted a discussion topic: "Fundraiser", as "ryan@example.com"
    And I sign out
    And I sign in as "julie@example.com"
    And I am on the members dashboard
    Then I should see "Fundraiser"
    And I should not see "remove this discussion"
    When I go to the main discussion page
    Then I should see "Fundraiser"
    And I should not see "remove this discussion"
