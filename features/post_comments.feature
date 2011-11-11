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

  @javascript
  Scenario: Delete someone else his comment on my latest status update
    Given I am a new, authenticated user
    And I have one user "example@example.com" with password "password" and name "John Doe"
    And I have a status update
    And "John doe" has a comment "very cool" on my latest status update
    And I am om the page of my latest status update
    When I click on delete on the comment of John doe
    Then I should not see "very cool"




