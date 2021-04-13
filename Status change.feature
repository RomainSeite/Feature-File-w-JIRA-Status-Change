Feature: "LD-3"  Status change
  Background: 
    Given file "<startingStatus>"
    
  Scenario Outline: file is "<status>"
    Given file "<startingStatus>"
    When "<action>"
    Then the file status should be "<status>"

Examples:
  | <startingStatus>   | <action>                   | <status>           |
  | not received       | the client sends file      | received           |
  | received           | 24h passed since reception | awaiting treatment |
  | awaiting treatment | analyst intervenes         | processed          |

  Scenario Outline: file is "<status>"
    Given file processed
    When file is "<status>"
    Then the file status should be "<status>"
    And the client should receive "<notification>"

Examples:
  | <status>           | <notification>                             |
  | complete           | your document is complete                  |
  | incomplete         | file xx is incorrect, send this file again |