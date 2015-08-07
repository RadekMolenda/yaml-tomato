Feature: Do Some things
  In order edit yaml files efectively
  As a user
  I want to know the yaml path my cursor is currently under

  Scenario: Displaying Path
    Given I insert:
    """
    en:
      one: One
      two:
        three: Three
        four: Four
    """
    When I press "C-x y"
    And switch to buffer "*Messages*"
    Then I should see "en.two.four"
