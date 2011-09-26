Feature: Site Login
  As a site user
  I want to log into the app
  So that I can start efficiently handling my issues


  Background:
    Given the following user:
      | password | password         |
      | email    | matt@example.net |
    And I go to the login page

  Scenario: Successful Login
    When I fill in the login form with:
      | Email    | matt@example.net |
      | Password | password         |
    And I submit the "login" form by pressing "Login"
    Then I should be on the home page

  Scenario: Login Failure
    When I fill in the login form with:
      | Email    | maynard@example.net |
      | Password | password         |
    And I submit the "login" form by pressing "Login"
    Then I should be on the login page
    And I see "Login Failure. Please try again."

  Scenario: Password protection
    When I fill in the login form with:
      | Email    | matt@example.net |
      | Password | supersecret      |
    Then password field does not show typed value
