Feature: Site Login
  As a site user
  I want to log into the app
  So that I can start efficiently handling my issues

  Scenario: Login Form
    Given the following user:
      | username | mattpolito       |
      | password | password         |
      | email    | matt@example.net |
    And I go to the login page
    When I fill in the login form with:
      | Email    | matt@example.net |
      | Password | password         |
    And I submit "login" form by pressing "Login"
    Then I am on the home page

