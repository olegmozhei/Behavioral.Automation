﻿Feature: Primer Design Initiation (1st requirement)
As a user interested in PCR primer design,
I want to provide a PCR template and specify design parameters,
So that I can initiate the process of designing primers.

Background:   
  Given application URL is opened
  
  @template_type_1
  Scenario: User can provide template as an NCBI accession number
    When user enters "NM_000250.2" into "Template" input
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then "Primers design" table should become visible within "180" seconds
    
  @template_type_2        
  Scenario: User can provide template as a sequence
    When user enters "GTCAAGCCAGTCACGCAGTAACGTTCATCAGCTAACGTAACAGTTAGAGGCTCGCTAAATCGCACTGTCGGCGTCCCTTGGGTATTTTACGCTAGCATCAGGTAGGCTAGCATGTATCTTTCCTCCCAGGGGTATGCGGGTGCGTGGACAAATGAGCAGCAAACGTAAATTCTCGGCGTGCTTGGTGTCTCGTATTTCTCCTGGAGATCAAGGAAATGTTTCATGACCAAGCGAAAGGCCGCTCTACGGAATGGATTTACGTTACTGCCTGCATAAGGAGACCGGTGTAGCCAAGGACGAAGGCGACCCTAGGTTCTAACCGTCGACTTCGGCGGTAAGGTATCACTCAGGAAGCAGACACTGATAGACACGGTCTAGCAGATCGTTTGACGACTAGGTCAAATTGAGTGGTTTAATATCGGCATGTCTGGCTTTAGAATTCAGTATAGTGCGCTGATCCGAGTCGAATTAAAAACACCAGTACCCAAAACCAGGCGGGCTCGCCACGTCGGCTAATCCTGGTACATTTTGTAAACAATGTTCTGAAGAAAATTTGTGAAAGAAGGACGGGTCATCGCCTACTAATAGCAACAACGATCGGCCGCACCTTCCATTGTCGTGGCGACGCTCGGATTACACGGCAAAGGTGCTTGTGTTCCGACAGGCTAGCATATAATCCTGAGGCGTTACCCCAATCGTTCACCGTCGGATTTGCTACAGCCCCTGAACGCTACATGTACGAAACCATGTTATGTATGCACTAGGCCAACAATAGGACGTAGCCTTGTAGTTAGTACGTAGCCTGGTCGCATAAGTACAGTAGATCCTCCCCGCGCATCCTATTTATTAAGTTAATTCTACAGCAAAACGATCATATGCAGATCCGCAGTGGCCGGTAGACACACGTCCACCCCGCTGCTCTGTGACAGGGACTAAAGAGGCGAAGATTATCGTGTGTGCCCCGTTATGGTCGAGTTCGGTCAGAGCGTCATTGCGAGTAGTCGTTTGCTTTCTCGAATTCCGAGCGATTAAGCGTGACAGTCCCAGCGAACCCACAAAACGTGATCGCAGTCCATGCGATCATACGCAAGAAGGAAGGTCCCCATACACCGACGCACCAGTTTACACGCCGTATGCATAAACGAGCTGCACAAACGAGAGTGCTTGAACTGGACCTCTAGTTCCTCTACAAAGAACAGGTTGACCTGTCGCGAAGTTGCCTTGCCTAGATGCAATGTCGGACGTATTACTTTTGCCTCAACGGCTCCTGCTTTCGCTGAAACCCAAGACAGGCAACAGTAACCGCCTTTTGAAGGCGAGTCCTTCGTCTGTGACTAACTGTGCCAAATCGTCTTCCAAACTCCTAATCCAGTTTAACTCACCAAATTATAGCCATACAGACCCTAATTTCATATCATATCACGCCATTAGCCTCTGCTAAAATTCTGTGCTCAAGGGTTTTGGTTCGCCCGAGTGATGTTGCCAATTAGGACCATCAAATGCACATGTTACAGGACTTCTTATAAATACTTTTTTCCTGGGGAGTAGCGGATCTTAATGGATGTTGCCAGCTGGTATGGAAGCTAATAGCGCCGGTGGGAGCGTAATCTGCCGTCTCCACCAACACAACGCTATCGGGTCATATTATAAGATTCCGCAATGGGGTTACTTATAGGTAGCCTTAACGATATCCGGAACTTGCGATGTACGTGCTATGCTTTAATACATACCTGGCCCAGTAGTTTTCCAATATGGGAACATCAATTGTACATCGGGCCGGGATAATCATGTCATCACGGAAGTAGCCGTAAGACAAATAATTCAAAAGAGATGTCGTTTTGCTAGTTCACGTGAAGGTGTCTCGCGCCACCTCTAAGTAAGTGGGCCGTCGAGACATTATCCCTGATTTTTTCACTACTATTAGTACTCACGGCGCAATACCACCACAGCCTTGTCTCGCCAGAATGCTGGTCAGCATACGGAAGAGCTCAAGGCAGGTC" into "Template" input
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then "Primers design" table should become visible
        
  @template_type_3 
  Scenario: User can provide template as a file in FASTA format
    When user uploads "TestData/CFTR_mRNA_sequence.fasta" after clicking on "Choose template file" button
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then "Primers design" table should become visible
   
  @specifying_parameters   
  Scenario: User can start primer design with specified parameters
    Given user entered "NM_000600.4" into "Template" input
    And user entered "200" into "Maximal size of PCR product" input
    And user entered "59" into "Minimal Melting Temperature of primers" input
    And user entered "62" into "Optimal Melting Temperature of primers" input
    And user entered "65" into "Maximal Melting Temperature of primers" input
    And user opened "Exon Junction span" dropdown and selected "Primer must span an exon-exon junction" in dropdown menu
    And "Perform specificity check" checkbox is unchecked
    When user clicks on "Get primers" button
    Then "Primers design" table should become visible within "180" seconds