Feature: Members will need a CMS for Foundation services

  Background:
    Given I am signed in as "ryan@example.com"

  Scenario: creation; happy path
    Given I am on the members dashboard
    When I click "Manage Services"
    Then I should be on the services index
    And I should see "No services currently listed"
    When I click "add a service"
    Then I should be on the new service page
    When I go to the members dashboard
    And I click on "Add Service"
    Then I should be on the new service page
    When I fill in "Yoga" for "Name"
    And I fill in "wednesday afternoons" for "Details"
    And I press "Create Service"
    Then I should be on the members dashboard
    And I should see "Yoga added as a service"
    When I go to the services index
    Then I should see "Yoga"
    And I should see "wednesday afternoons"


  Scenario: edit a service
    Given the foundation has a "Cooking" service
    And I am on the services index
    When I click "edit this service"
    And I fill in "Vollyball" for "Name"
    And I fill in "at the rec center" for "Details"
    And I press "Update Service"
    Then I should be on the members dashboard
    And I should see "Vollyball service was edited"
    When I go to the services index
    Then I should see "Vollyball"
    And I should see "at the rec center"

  Scenario: delete a service
    Given the foundation has a "Cooking" service
    And I am on the services index
    And I click "remove this service"
    Then I should be on the members dashboard page
    And I should see "Service was removed"
    When I go to the services index
    Then I should not see "Cooking"
