Feature: Like Posts or Comments
  In order to show people my opinion
  As an user
  I want to like Posts or comments

  Scenario: Like a status update
    Given I am a new, authenticated user
    And I have a status update
    And I am om the page of my latest status update
    When I click "Like" in my latest status update
    Then I should see "You like this."

  Scenario: Unlike a status update
    Given I am a new, authenticated user
    And I have a status update
    And I am om the page of my latest status update
    And I click "Like" in my latest status update
    When I click "Unlike" in my latest status update
    Then I should not see "You like this."

