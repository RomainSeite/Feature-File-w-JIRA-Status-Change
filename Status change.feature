Feature: "LD-3"  Status change
  Scenario: file status is received
    Given file "received"
    When "the client sends file"
    Then the file status should be "received"

Scenario: file status is awaiting treatment
  Given file "awaiting treatment"
  When "24h passed since reception"
  Then the file status should be "<awaiting treatment>"

Scenario: file status is processed
  Given file "processed"
  When "analyst intervenes"
  Then the file status should be "processed"

Scenario Outline: file is "<status>"
  Given file processed
  When file is processed
  Then the file status should be "<status>"
  And the client should receive "<notification>"

Examples:
  | <status>           | <notification>                             |
  | complete           | your document is complete                  |
  | incomplete         | file xx is incorrect, send this file again |