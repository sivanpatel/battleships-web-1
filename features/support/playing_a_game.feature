Feature: Playing a game
  As a Player
  I want to be able to shoot at coordinates
  And I want to see if they hit

  Scenario: Shooting at a Ship
    Given I am on the single player page
    And I enter coordinates
    And I press fire
    Then I want to see if I have hit
