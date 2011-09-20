Feature: Page Authorization
  As a site owner
  I want certain pages to be private
  So that users may have privacy when using the site

  Scenario: Trying to access unauthorized page
    Given I am not logged in
    When  I go to the home page
    Then  I should be on the login page
    And   I see "Not authorized to view this page, please login."
