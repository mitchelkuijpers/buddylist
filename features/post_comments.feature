Feature: Post Comments
  In order to post comments
  As an user
  I want to add comments

  Background:
    Given I am a new, authenticated user
    And I have one user "example2@example.com" with password "password" and name "john doe"
    And "john doe" has a status update "I feel good today"
    And I am the profile page of "john doe"

  Scenario: Add comment on status update
    When I post a comment "Good me too!" on the status update "I feel good today"
    Then I should see comment "Good me too!"

  Scenario: Get an error when trying to post en empty comment
    When I post a comment "" on the status update "I feel good today"
    Then I should see an error


