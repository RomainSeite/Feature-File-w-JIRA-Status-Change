Feature: "LD-3"  Status change
  Background: 
    Given file "<status>"
    
  Scenario Outline: file "<status>"
    When "<action>"
    Then the file status should be "<status>"

Examples:
  | <startingStatus>   | <action>                   | <status>           |
  | not received       | the client sends file      | received           |
  | received           | 24h passed since reception | awaiting treatment |
  | awaiting treatment | analyst intervenes         | processed          |

  Scenario Outline: file "<status>"
    When "<action>"
    Then the file status should be "<status>"
    And the client should receive "<notification>"

Examples:
  | <startingStatus>   | <action>                   | <status>           | <notification>                             |
  | processed          | file is invalid            | complete           | your document is complete                  |
  | processed          | file is valid              | incomplete         | file xx is incorrect, send this file again |