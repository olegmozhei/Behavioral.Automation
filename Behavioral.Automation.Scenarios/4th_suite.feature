Feature: 4d_suite
User opened main page
User provides template accession number (DNA)
User provides own primers 
User starts evaluation and get primer pairs and their attributes

@Reference:PrimerDesign-1
@Reference:PrimerDesign-2
    
    
Scenario: User gets the result of evaluation for own provided primers for DNA (accession number)
    Given application URL is opened
    When user enters "U49845" into "Template" input
    And user enters "CCCCAGTGGCAAGAGTCAAT" into "Forward primer" input
    And user enters "AACGAAAGCCAGCTCGGTAA" into "Reverse primer" input
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then "Primers design" table should become visible 
    
Scenario Outline: User gets an error of evaluation for own provided primers for DNA. One of primer enters is invalid.
    Given application URL is opened
    When user enters "U49845" into "Template" input
    And user enters "<1st_input>" into "Forward primer" input
    And user enters "<2nd_input>" into "Reverse primer" input
    And user clicks on "Get primers" button
    Then label "Error" should become visible
    Examples:
    | 1st_input                               | 2nd_input            |
    | CCCCAGTGGCAAGAGTCAAT                    | GGGGGGGGGGGGGGGGGG   |
    | AF0719899999999999999999999999999999998 | AACGAAAGCCAGCTCGGTAA |
    
    
