Feature: Requirement #5
Providing RNA accession number template and specifying exon-exon junction input to application
    
Background: 
    Given application URL is opened

@requirement_5
Scenario: RNA template + exon-exon junction
    Given user entered "NM_000207.3" into "Template" input
    When user enters "CAGGACAGGCTGCATCAGAA" into "Forward primer" input
    And user opens "Exon junction span" dropdown and selects "Primer must span an exon-exon junction" in dropdown menu
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then "Primers design" table should become visible
    
Scenario: DNA template + reverse primer
    Given user entered "NM_000207.3" into "Template" input
    When user enters "AGAGGGAGCAGATGCTGGTA" into "Reverse primer" input
    And user opens "Exon junction span" dropdown and selects "Primer must span an exon-exon junction" in dropdown menu
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then "Primers design" table should become visible
    
Scenario: RNA template + exon-exon junction match modified
    Given user entered "NM_000207.3" into "Template" input
    When user enters "CAGGACAGGCTGCATCAGAA" into "Forward primer" input
    And user opens "Exon junction span" dropdown and selects "Primer must span an exon-exon junction" in dropdown menu
    And user enters "8" into "Min Site overlap by five prime end" input
    And user enters "4" into "Min Site overlap by three prime end" input
    And user enters "7" into "Max Site overlap by three prime end" input
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then "Primers design" table should become visible
    
Scenario: RNA template + min site overlap by five prime end equals 0
    Given user entered "NM_000207.3" into "Template" input
    When user enters "CAGGACAGGCTGCATCAGAA" into "Forward primer" input
    And user opens "Exon junction span" dropdown and selects "Primer must span an exon-exon junction" in dropdown menu
    And user enters "0" into "Min Site overlap by five prime end" input
    And user enters "4" into "Min Site overlap by three prime end" input
    And user enters "7" into "Max Site overlap by three prime end" input
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then label "Error" should have "Please correct the following errors: Illegal value for PRIMER_MIN_5_PRIME_OVERLAP_OF_JUNCTION." text
    
Scenario: RNA template + min site overlap by three prime end equals 0
    Given user entered "NM_000207.3" into "Template" input
    When user enters "CAGGACAGGCTGCATCAGAA" into "Forward primer" input
    And user opens "Exon junction span" dropdown and selects "Primer must span an exon-exon junction" in dropdown menu
    And user enters "8" into "Min Site overlap by five prime end" input
    And user enters "0" into "Min Site overlap by three prime end" input
    And user enters "7" into "Max Site overlap by three prime end" input
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then label "Error" should have "Please correct the following errors: Illegal value for PRIMER_MIN_3_PRIME_OVERLAP_OF_JUNCTION." text
    
Scenario: RNA template + max site overlap by three prime end equals 10000000000000
    Given user entered "NM_000207.3" into "Template" input
    When user enters "CAGGACAGGCTGCATCAGAA" into "Forward primer" input
    And user opens "Exon junction span" dropdown and selects "Primer must span an exon-exon junction" in dropdown menu
    And user enters "8" into "Min Site overlap by five prime end" input
    And user enters "4" into "Min Site overlap by three prime end" input
    And user enters "10000000000000" into "Max Site overlap by three prime end" input
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then label "Error" should have "Exception error: Cannot convert string '10000000000000' to int, overflow ." text