Feature: as I member I want to add to discussion by adding replies

  Background:
    Given I am signed in as "ryan@example.com"

  Scenario:
    Given there was 1 discussion posted earlier this week
    And I am on the members dashboard
    Then I should see "no replies"
    And I click "see more >>"
    And I click "reply to this discussion"
    Then I should see "Post a reply to this discussion"
    When I fill in "I think that is a great idea" for "Content"
    And I press "Create Reply"
    Then I should see "Your reply was successfully posted"
    And I should see "ryan moret replied:"
    When I go to the members dashboard
    Then I should see "1 reply"
