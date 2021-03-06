Feature: Post Comments
  In order to post comments
  As an user
  I want to add comments

  Scenario: Add comment on status update
    Given I am a new, authenticated user
    And I have one user "example2@example.com" with password "password" and name "John Doe"
    And I am friends with "John Doe"
    And "John Doe" has a status update "I feel good today"
    And I am the profile page of "John Doe"
    When I post a comment "Good me too!" on the status update "I feel good today"
    Then I should see comment "Good me too!"





