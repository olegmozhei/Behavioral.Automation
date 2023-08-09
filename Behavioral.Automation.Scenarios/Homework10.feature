Feature: Homework10
wiki: https://de.wikipedia.org/wiki/Primerdesign
DNA sequencing is used to read DNA (A, C, T, G nucleotides)
PCR is used to amplify little part of DNA (for example, 1000 bps)

  @Reference:PrimerDesign-1
  @Reference:PrimerDesign-2
  # I decided to change this test case ...

  Scenario: User can run primers design
    Given application URL is opened 
    And user entered "GTCAAGCCAGTCACGCAGTAACGTTCATCAGCTAACGTAACAGTTAGAGGCTCGCTAAATCGCACTGTCGGCGTCCCTTGGGTATTTTACGCTAGCATCAGGTAGGCTAGCATGTATCTTTCCTCCCAGGGGTATGCGGGTGCGTGGACAAATGAGCAGCAAACGTAAATTCTCGGCGTGCTTGGTGTCTCGTATTTCTCCTGGAGATCAAGGAAATGTTTCATGACCAAGCGAAAGGCCGCTCTACGGAATGGATTTACGTTACTGCCTGCATAAGGAGACCGGTGTAGCCAAGGACGAAGGCGACCCTAGGTTCTAACCGTCGACTTCGGCGGTAAGGTATCACTCAGGAAGCAGACACTGATAGACACGGTCTAGCAGATCGTTTGACGACTAGGTCAAATTGAGTGGTTTAATATCGGCATGTCTGGCTTTAGAATTCAGTATAGTGCGCTGATCCGAGTCGAATTAAAAACACCAGTACCCAAAACCAGGCGGGCTCGCCACGTCGGCTAATCCTGGTACATTTTGTAAACAATGTTCTGAAGAAAATTTGTGAAAGAAGGACGGGTCATCGCCTACTAATAGCAACAACGATCGGCCGCACCTTCCATTGTCGTGGCGACGCTCGGATTACACGGCAAAGGTGCTTGTGTTCCGACAGGCTAGCATATAATCCTGAGGCGTTACCCCAATCGTTCACCGTCGGATTTGCTACAGCCCCTGAACGCTACATGTACGAAACCATGTTATGTATGCACTAGGCCAACAATAGGACGTAGCCTTGTAGTTAGTACGTAGCCTGGTCGCATAAGTACAGTAGATCCTCCCCGCGCATCCTATTTATTAAGTTAATTCTACAGCAAAACGATCATATGCAGATCCGCAGTGGCCGGTAGACACACGTCCACCCCGCTGCTCTGTGACAGGGACTAAAGAGGCGAAGATTATCGTGTGTGCCCCGTTATGGTCGAGTTCGGTCAGAGCGTCATTGCGAGTAGTCGTTTGCTTTCTCGAATTCCGAGCGATTAAGCGTGACAGTCCCAGCGAACCCACAAAACGTGATCGCAGTCCATGCGATCATACGCAAGAAGGAAGGTCCCCATACACCGACGCACCAGTTTACACGCCGTATGCATAAACGAGCTGCACAAACGAGAGTGCTTGAACTGGACCTCTAGTTCCTCTACAAAGAACAGGTTGACCTGTCGCGAAGTTGCCTTGCCTAGATGCAATGTCGGACGTATTACTTTTGCCTCAACGGCTCCTGCTTTCGCTGAAACCCAAGACAGGCAACAGTAACCGCCTTTTGAAGGCGAGTCCTTCGTCTGTGACTAACTGTGCCAAATCGTCTTCCAAACTCCTAATCCAGTTTAACTCACCAAATTATAGCCATACAGACCCTAATTTCATATCATATCACGCCATTAGCCTCTGCTAAAATTCTGTGCTCAAGGGTTTTGGTTCGCCCGAGTGATGTTGCCAATTAGGACCATCAAATGCACATGTTACAGGACTTCTTATAAATACTTTTTTCCTGGGGAGTAGCGGATCTTAATGGATGTTGCCAGCTGGTATGGAAGCTAATAGCGCCGGTGGGAGCGTAATCTGCCGTCTCCACCAACACAACGCTATCGGGTCATATTATAAGATTCCGCAATGGGGTTACTTATAGGTAGCCTTAACGATATCCGGAACTTGCGATGTACGTGCTATGCTTTAATACATACCTGGCCCAGTAGTTTTCCAATATGGGAACATCAATTGTACATCGGGCCGGGATAATCATGTCATCACGGAAGTAGCCGTAAGACAAATAATTCAAAAGAGATGTCGTTTTGCTAGTTCACGTGAAGGTGTCTCGCGCCACCTCTAAGTAAGTGGGCCGTCGAGACATTATCCCTGATTTTTTCACTACTATTAGTACTCACGGCGCAATACCACCACAGCCTTGTCTCGCCAGAATGCTGGTCAGCATACGGAAGAGCTCAAGGCAGGTC" into "Template" input
    And "Perform specificity check" checkbox is unchecked
    When user clicks on "Get primers" button
    Then "Primers design" table should become visible
    
    
    Scenario: User can run primers design providing valid DNA template 
    Given application URL is opened 
    And user entered "GTCAAGCCAGTCACGCAGTAACGTTCATCAGCTAACGTAACAGTTAGAGGCTCGCTAAATCGCACTGTCGGCGTCCCTTGGGTATTTTACGCTAGCATCAGGTAGGCTAGCATGTATCTTTCCTCCCAGGGGTATGCGGGTGCGTGGACAAATGAGCAGCAAACGTAAATTCTCGGCGTGCTTGGTGTCTCGTATTTCTCCTGGAGATCAAGGAAATGTTTCATGACCAAGCGAAAGGCCGCTCTACGGAATGGATTTACGTTACTGCCTGCATAAGGAGACCGGTGTAGCCAAGGACGAAGGCGACCCTAGGTTCTAACCGTCGACTTCGGCGGTAAGGTATCACTCAGGAAGCAGACACTGATAGACACGGTCTAGCAGATCGTTTGACGACTAGGTCAAATTGAGTGGTTTAATATCGGCATGTCTGGCTTTAGAATTCAGTATAGTGCGCTGATCCGAGTCGAATTAAAAACACCAGTACCCAAAACCAGGCGGGCTCGCCACGTCGGCTAATCCTGGTACATTTTGTAAACAATGTTCTGAAGAAAATTTGTGAAAGAAGGACGGGTCATCGCCTACTAATAGCAACAACGATCGGCCGCACCTTCCATTGTCGTGGCGACGCTCGGATTACACGGCAAAGGTGCTTGTGTTCCGACAGGCTAGCATATAATCCTGAGGCGTTACCCCAATCGTTCACCGTCGGATTTGCTACAGCCCCTGAACGCTACATGTACGAAACCATGTTATGTATGCACTAGGCCAACAATAGGACGTAGCCTTGTAGTTAGTACGTAGCCTGGTCGCATAAGTACAGTAGATCCTCCCCGCGCATCCTATTTATTAAGTTAATTCTACAGCAAAACGATCATATGCAGATCCGCAGTGGCCGGTAGACACACGTCCACCCCGCTGCTCTGTGACAGGGACTAAAGAGGCGAAGATTATCGTGTGTGCCCCGTTATGGTCGAGTTCGGTCAGAGCGTCATTGCGAGTAGTCGTTTGCTTTCTCGAATTCCGAGCGATTAAGCGTGACAGTCCCAGCGAACCCACAAAACGTGATCGCAGTCCATGCGATCATACGCAAGAAGGAAGGTCCCCATACACCGACGCACCAGTTTACACGCCGTATGCATAAACGAGCTGCACAAACGAGAGTGCTTGAACTGGACCTCTAGTTCCTCTACAAAGAACAGGTTGACCTGTCGCGAAGTTGCCTTGCCTAGATGCAATGTCGGACGTATTACTTTTGCCTCAACGGCTCCTGCTTTCGCTGAAACCCAAGACAGGCAACAGTAACCGCCTTTTGAAGGCGAGTCCTTCGTCTGTGACTAACTGTGCCAAATCGTCTTCCAAACTCCTAATCCAGTTTAACTCACCAAATTATAGCCATACAGACCCTAATTTCATATCATATCACGCCATTAGCCTCTGCTAAAATTCTGTGCTCAAGGGTTTTGGTTCGCCCGAGTGATGTTGCCAATTAGGACCATCAAATGCACATGTTACAGGACTTCTTATAAATACTTTTTTCCTGGGGAGTAGCGGATCTTAATGGATGTTGCCAGCTGGTATGGAAGCTAATAGCGCCGGTGGGAGCGTAATCTGCCGTCTCCACCAACACAACGCTATCGGGTCATATTATAAGATTCCGCAATGGGGTTACTTATAGGTAGCCTTAACGATATCCGGAACTTGCGATGTACGTGCTATGCTTTAATACATACCTGGCCCAGTAGTTTTCCAATATGGGAACATCAATTGTACATCGGGCCGGGATAATCATGTCATCACGGAAGTAGCCGTAAGACAAATAATTCAAAAGAGATGTCGTTTTGCTAGTTCACGTGAAGGTGTCTCGCGCCACCTCTAAGTAAGTGGGCCGTCGAGACATTATCCCTGATTTTTTCACTACTATTAGTACTCACGGCGCAATACCACCACAGCCTTGTCTCGCCAGAATGCTGGTCAGCATACGGAAGAGCTCAAGGCAGGTC" into "Template" input
    And user entered "1" into "Forward primer from" input
    And user entered "51" into "Forward primer to" input
    And user entered "504" into "Reverse primer from" input
    And user entered "558" into "Reverse primer to" input
    And user entered "450" into "Minimal size of PCR product" input
    And user entered "1" into "Number of primers to return" input
    And "Perform specificity check" checkbox is unchecked
    When user clicks on "Get primers" button
    Then "Primers design" table should become visible
    And "Primers design" table should have the following rows:
       | Sequence (5'->3')    | Template strand | Length | Start | Stop | Tm    | GC%   | Self complementarity | Self 3' complementarity |
       | GTCAAGCCAGTCACGCAGTA | Plus            | 20     | 1     | 20   | 60.32 | 55.00 | 3.00                 | 2.00                    |
       | TGTACCAGGATTAGCCGACG | Minus           | 20     | 526   | 507  | 59.26 | 55.00 | 4.00                 | 3.00                    |
      

 
    Scenario: User see error notification if provided input is invalid 
    Given application URL is opened 
    And user entered " " into "Template" input
    And user entered "1" into "Forward primer from" input
    And user entered "51" into "Forward primer to" input
    And user entered "504" into "Reverse primer from" input
    And user entered "558" into "Reverse primer to" input
    And user entered "450" into "Minimal size of PCR product" input
    And user entered "5" into "Number of primers to return" input
    And "Perform specificity check" checkbox is unchecked
    When user clicks on "Get primers" button
    Then label "Error" should have "Exception error: No sequence input was provided ." text
    
    
  Scenario: User can start evaluation providing DNA accession number and specific primers 
    Given application URL is opened 
    And user entered "NG_012337.1" into "Template" input
    And user entered "GTGCCAGTAGAACAGGCCAT" into "Forward primer" input
    And user entered "TCAGTGGGGGAAGGCTATCA" into "Reverse primer" input
    And "Perform specificity check" checkbox is unchecked
    When user clicks on "Get primers" button
    Then "Primers design" table should become visible
    And "Primers design" table should have the following rows:
      | Sequence (5'->3')     | Template strand | Length | Start | Stop | Tm    | GC%   | Self complementarity | Self 3' complementarity |
      |  GTGCCAGTAGAACAGGCCAT | Plus            | 20     | 2845  | 2864 | 60.04 | 55.00 | 5.00                 | 2.00                    |
      | TCAGTGGGGGAAGGCTATCA  | Minus           | 20     | 3391  | 3372 | 59.96 | 55.00 | 3.00                 | 1.00                    |

  
    
  
    Scenario: User can start primers design providing RNA accession number 
    Given application URL is opened 
    And user entered "NM_002046.7" into "Template" input
    And user entered "1" into "Number of primers to return" input
    And user opened "Exon Junction span" dropdown and selected "Primer must span an exon-exon junction" in dropdown menu
    And "Perform specificity check" checkbox is unchecked
    When user clicks on "Get primers" button
    Then "Primers design" table should become visible
    And  "Primers design" table should have the following rows:
      | Sequence (5'->3')     | Template strand | Length | Start | Stop | Tm    | GC%   | Self complementarity | Self 3' complementarity |
      | GAGAAGGCTGGGGCTCATTT  | Plus            | 20     | 392   | 411  | 60.03 | 55.00 | 3.00                 | 0.00                    |
      | AGTGATGGCATGGACTGTGG  | Minus           | 20     | 622   | 603  | 60.03 | 55.00 | 5.00                 | 0.00                    |


    
  