Feature: Post Comments
  In order to post comments
  As an user
  I want to create and remove comments

  Scenario: Add comment
    Given I am a new, authenticated user
    And I have one user "example2@example.com" with password "password" and name "john doe"
    And I am the profile page of "john doe"
    When I post a comment "nice status update"
    Then I should see "nice status update"
