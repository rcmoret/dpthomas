Feature: I want to protect certain pages

  Scenario Outline: Test each page in examples
    When I go to <page>
    Then I should be on the sign in page
    And I should see "Must be signed in"

    Examples:
      |page                         |
      |the new event page           |
      |the members dashboard        |
      |the new discussion page      |
