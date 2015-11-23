Feature: Yaml path under cursor
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
    When I call "yaml-tomato-show-current-path"
    Then I should see message "en.four"
    When I go to line "4"
    And I call "yaml-tomato-show-current-path"
    Then I should see message "en.two.three"

  Scenario: Copying a Path
    Given the buffer is empty
    And I insert:
    """
    foo:
      bar: One
      baz:
        quckx: Three
      quack: Four
    """
    When I call "yaml-tomato-copy"
    Then I should copied "foo.quack"
    When I go to line "2"
    And I call "yaml-tomato-copy"
    Then I should copied "foo.bar"
