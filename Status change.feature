Feature: "LD-2"  Status change
  Scenario Outline: file "<status>"
    Given a file "<startingStatus>"
    When "<action>"
    Then the file status should be "<status>"

Examples:
  | <startingStatus>   | <action>                   | <status>           |
  | received           | 24h passed since reception | awaiting treatment |
  | awaiting treatment | analyst intervenes         | processed          |
  | processed          | file is invalid            | complete           |
  | processed          | file is valid              | incomplete         |