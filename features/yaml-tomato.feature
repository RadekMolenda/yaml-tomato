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
    When I call "show-current-path"
    Then I should see message "en.two.four"
    When I go to line "4"
    And I call "show-current-path"
    Then I should see message "en.two.three"
