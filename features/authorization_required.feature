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
      |the main discussion page     |
      |the new service page         |
      |the email listing index      |

  Scenario:
    Given the foundation has an "Education" service
    When I go to the services index
    Then I should see "Education"
    And I should not see "add a service"
    And I should not see "edit this service"
    And I should not see "remove this service"
