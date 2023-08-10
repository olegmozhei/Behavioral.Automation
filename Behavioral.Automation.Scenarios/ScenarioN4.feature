Feature: Providing template accession number (DNA)
User opened main page
User provides template accession number (DNA)
User provides primers
User starts evaluation	
User can see primers pairs
User can see attributes for designed primers
    
    Scenario: User can provide template accession number
        Given application URL is opened
        And user entered "NM_000492.4" into "Template" input
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible within "300" seconds
        And "Primers design" table should have the following rows:
          | Sequence (5'->3')    | Length | Tm    |
          | GTGGAGGTCAACGAGCAAGA | 20     | 59.97 |
          
 Scenario: User can provide forward primers
     Given application URL is opened
     And user entered "NM_000492.4" into "Template" input
     And user entered "GTAGTAGGTCTTTGGCATTAGGAGCT" into "Forward primer" input
     When user clicks on "Get primers" button
     Then "Primers design" table should become visible within "300" seconds
     And "Primers design" table should have the following rows:
       | Sequence (5'->3')          | Length | Tm |
       | GTAGTAGGTCTTTGGCATTAGGAGCT | 26     | 62.09 |
       
    Scenario: User can provide reverse primers
        Given application URL is opened
        And user entered "NM_000492.4" into "Template" input
        And user entered "AAGTCCACAGAAGGCAGACG" into "Reverse primer" input
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible within "300" seconds
        And "Primers design" table should have the following rows:
          | Sequence (5'->3')    | Length | Tm |
          | AAGTCCACAGAAGGCAGACG | 20     | 59.97 |
          
    Scenario: User can provide forward and reverse primers
        Given application URL is opened
        And user entered "NM_000492.4" into "Template" input
        And user entered "GTAGTAGGTCTTTGGCATTAGGAGCT" into "Forward primer" input
        And user entered "AAGTCCACAGAAGGCAGACG" into "Reverse primer" input
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible within "300" seconds
        And "Primers design" table should have the following rows:
          | Sequence (5'->3')          | Length | Tm    |
          | GTAGTAGGTCTTTGGCATTAGGAGCT | 26     | 62.09 |
          | AAGTCCACAGAAGGCAGACG       | 20     | 59.97 |