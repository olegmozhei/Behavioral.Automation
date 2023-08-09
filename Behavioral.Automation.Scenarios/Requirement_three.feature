Feature: Requirement #3
Providing invalid DNA or invalid settings template to application
    
Background: 
    Given application URL is opened

@requirement_3
Scenario: Invalid DNA template
    Given user entered "UUU12345" into "Template" input
    When user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then label "Error" should have "Exception error: GI/accession/sequence mismatch: nucleotide input required but protein provided ." text
	
Scenario: "Forward primer from" input is invalid
    Given user entered "U12345" into "Template" input
    When user enters "1000" into "Forward primer from" input
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then label "Error" should have "Exception error: Invalid from coordinate (greater than sequence length) ." text
    
    
Scenario: "Forward primer to" input is invalid
    Given user entered "U12345" into "Template" input
    When user enters "0" into "Forward primer to" input
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then label "Error" should have ""From" position is larger than "To" position for a given primer or primer range is beyond the PCR product range: forward from = 1, forward to = 0, reverse from = 71, reverse to = 426. PCR product range: min = 70, max = 1000." text
    
    
Scenario: "Minimal size of PCR product" input is invalid
    Given user entered "U12345" into "Template" input
    When user enters "0" into "Minimal size of PCR product" input
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then label "Error" should have "Please correct the following errors: PRIMER_MAX_SIZE > min PRIMER_PRODUCT_SIZE_RANGE." text
    
Scenario: "Maximal size of PCR product" input is invalid
    Given user entered "U12345" into "Template" input
    When user enters "0" into "Maximal size of PCR product" input
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then label "Error" should have "PCR product range is invalid: min = 70, max = 0." text