Feature: placing the ships
  In order to start playing the game
  As a Player
  I want to be able to place my ships

  Scenario: Placing an aircraft carrier
    Given I am on the new game page
    When I press "Submit"
    Then I should see "Aircraft Carrier placed!"
