Feature: Providing template accession number (RNA)
User opened main page
User provides template accession number (RNA)
User specify exon-exon junction attribute
User starts design	
User can see primers pairs
User can see attributes for designed primers
    
    Scenario: User choose must span exon-exon junction
        Given application URL is opened
        And user entered "NM_000492.4" into "Template" input
        And user opened "Exon Junction span" dropdown and selected "Primer must span an exon-exon junction" in dropdown menu
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible within "300" seconds
        And "Primers design" table should have the following rows:
          | Sequence (5'->3')    | Length | Tm |
          | ACTGGAGCAGGCAAGACTTC | 20     | 59.96 |
          
    Scenario: User choose may not span exon-exon junction
        Given application URL is opened
        And user entered "NM_000492.4" into "Template" input
        And user opened "Exon Junction span" dropdown and selected "Primer may not span an exon-exon junction" in dropdown menu
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible within "300" seconds
        And "Primers design" table should have the following rows:
          | Sequence (5'->3')    | Length | Tm    |
          | GAGGCAGTCTGTCCTGAACC | 20     | 60.04 |