Feature: Playing an online two-player game
  In order to play battleships
  As one player
  I would like to play against another Player

  Scenario: Entering my name
    Given I am on the name page
    And I fill in "name" with "Sivan"
    Then I press "Submit"
    When I press "Two Player"
    Then I should see "Waiting for Player 2"

  Scenario: Entering the second name
    Given I am joining the game
    Given someone else joins the same game
    Then we should see different things
