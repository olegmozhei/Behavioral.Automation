Feature: Requirement #4
Providing DNA accession number template with primers to application
    
Background: 
    Given application URL is opened

@requirement_4
Scenario: DNA template + forward primer
    Given user entered "NC_001457.1" into "Template" input
    When user enters "AGAGGAGGACCGCTTGGTAT" into "Forward primer" input
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then "Primers design" table should become visible
    
Scenario: DNA template + reverse primer
    Given user entered "NC_001457.1" into "Template" input
    When user enters "GCCTGGCTCTCGGATTCTAC" into "Reverse primer" input
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then "Primers design" table should become visible
    
 