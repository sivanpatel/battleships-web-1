Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Going to a new page
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"

  Scenario: Starting a new game
  	Given I am on the new game page
  	When I submit "name"
  	Then I should visit the game page
    Then a "new game" is created
