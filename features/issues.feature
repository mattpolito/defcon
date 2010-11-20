Feature:
  As a user
  I want to be able to add and edit issues
  
 Scenario: Create an Issue  
   Given I am a logged in user
   And I follow "Add Issue"
   And I fill in the following:
     | Title          | Redo styling and page design                              |
     | Description    | Re-Design layout and issues page along with better styles |
   And I press "Add Issue"
   Then I should see "You have successfully added a new Issue!"

  Scenario: Automatically fill in Author
    Given I am a logged in user
    And I follow "Add Issue"
    Then the "issue_author" field should contain "user@example.com"
