Feature: Primer Design Assessment (2nd, 3rd and 5th requirements)
This feature allows users to design primers by providing DNA or 
RNA templates and adjusting settings. 
The Primer-BLAST tool generates primer pairs based on the chosen parameters, 
displaying their attributes for user evaluation. 
Clear error notifications show up to users in case of input issues.
    
    
    @DNA_sequence_template
    Scenario: User can design primers providing DNA template and see attributes and primer pairs
        Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
        And user entered "GTCAAGCCAGTCACGCAGTAACGTTCATCAGCTAACGTAACAGTTAGAGGCTCGCTAAATCGCACTGTCGGCGTCCCTTGGGTATTTTACGCTAGCATCAGGTAGGCTAGCATGTATCTTTCCTCCCAGGGGTATGCGGGTGCGTGGACAAATGAGCAGCAAACGTAAATTCTCGGCGTGCTTGGTGTCTCGTATTTCTCCTGGAGATCAAGGAAATGTTTCATGACCAAGCGAAAGGCCGCTCTACGGAATGGATTTACGTTACTGCCTGCATAAGGAGACCGGTGTAGCCAAGGACGAAGGCGACCCTAGGTTCTAACCGTCGACTTCGGCGGTAAGGTATCACTCAGGAAGCAGACACTGATAGACACGGTCTAGCAGATCGTTTGACGACTAGGTCAAATTGAGTGGTTTAATATCGGCATGTCTGGCTTTAGAATTCAGTATAGTGCGCTGATCCGAGTCGAATTAAAAACACCAGTACCCAAAACCAGGCGGGCTCGCCACGTCGGCTAATCCTGGTACATTTTGTAAACAATGTTCTGAAGAAAATTTGTGAAAGAAGGACGGGTCATCGCCTACTAATAGCAACAACGATCGGCCGCACCTTCCATTGTCGTGGCGACGCTCGGATTACACGGCAAAGGTGCTTGTGTTCCGACAGGCTAGCATATAATCCTGAGGCGTTACCCCAATCGTTCACCGTCGGATTTGCTACAGCCCCTGAACGCTACATGTACGAAACCATGTTATGTATGCACTAGGCCAACAATAGGACGTAGCCTTGTAGTTAGTACGTAGCCTGGTCGCATAAGTACAGTAGATCCTCCCCGCGCATCCTATTTATTAAGTTAATTCTACAGCAAAACGATCATATGCAGATCCGCAGTGGCCGGTAGACACACGTCCACCCCGCTGCTCTGTGACAGGGACTAAAGAGGCGAAGATTATCGTGTGTGCCCCGTTATGGTCGAGTTCGGTCAGAGCGTCATTGCGAGTAGTCGTTTGCTTTCTCGAATTCCGAGCGATTAAGCGTGACAGTCCCAGCGAACCCACAAAACGTGATCGCAGTCCATGCGATCATACGCAAGAAGGAAGGTCCCCATACACCGACGCACCAGTTTACACGCCGTATGCATAAACGAGCTGCACAAACGAGAGTGCTTGAACTGGACCTCTAGTTCCTCTACAAAGAACAGGTTGACCTGTCGCGAAGTTGCCTTGCCTAGATGCAATGTCGGACGTATTACTTTTGCCTCAACGGCTCCTGCTTTCGCTGAAACCCAAGACAGGCAACAGTAACCGCCTTTTGAAGGCGAGTCCTTCGTCTGTGACTAACTGTGCCAAATCGTCTTCCAAACTCCTAATCCAGTTTAACTCACCAAATTATAGCCATACAGACCCTAATTTCATATCATATCACGCCATTAGCCTCTGCTAAAATTCTGTGCTCAAGGGTTTTGGTTCGCCCGAGTGATGTTGCCAATTAGGACCATCAAATGCACATGTTACAGGACTTCTTATAAATACTTTTTTCCTGGGGAGTAGCGGATCTTAATGGATGTTGCCAGCTGGTATGGAAGCTAATAGCGCCGGTGGGAGCGTAATCTGCCGTCTCCACCAACACAACGCTATCGGGTCATATTATAAGATTCCGCAATGGGGTTACTTATAGGTAGCCTTAACGATATCCGGAACTTGCGATGTACGTGCTATGCTTTAATACATACCTGGCCCAGTAGTTTTCCAATATGGGAACATCAATTGTACATCGGGCCGGGATAATCATGTCATCACGGAAGTAGCCGTAAGACAAATAATTCAAAAGAGATGTCGTTTTGCTAGTTCACGTGAAGGTGTCTCGCGCCACCTCTAAGTAAGTGGGCCGTCGAGACATTATCCCTGATTTTTTCACTACTATTAGTACTCACGGCGCAATACCACCACAGCCTTGTCTCGCCAGAATGCTGGTCAGCATACGGAAGAGCTCAAGGCAGGTC" into "Template" input
        And user entered "80" into "Forward primer from" input
        And user entered "250" into "Forward primer to" input
        And user entered "600" into "Reverse primer from" input
        And user entered "850" into "Reverse primer to" input
        And user entered "200" into "Minimal size of PCR product" input
        And user entered "600" into "Maximal size of PCR product" input
        And user opened "Database" dropdown and selected "Refseq representative genomes" in dropdown menu
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible within "180" seconds
        And "Primers design" table should have the following rows:
          | Sequence (5'->3')    | Length | Tm    |
          | GTGCGTGGACAAATGAGCAG | 20     | 60.11 |
          | TGTCGGAACACAAGCACCTT | 20     | 60.11 |
    
    @RNA_accession_number   
    Scenario: User can design primers providing RNA template and see attributes and primer pairs
        Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
        And user entered "NM_000250.2" into "Template" input
        And user opened "Exon Junction span" dropdown and selected "<Exon junction span option>" in dropdown menu
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible within "180" seconds             
    Examples:
      | Exon junction span option                 |
      | Primer must span an exon-exon junction    |
      | Primer may not span an exon-exon junction |
                 
    @error_1        
    Scenario: User can see error notification providing invalid input
        Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
        And user entered "<invalid_input>" into "Template" input
        And user entered "59" into "Minimal Melting Temperature of primers" input
        And user entered "62" into "Optimal Melting Temperature of primers" input
        And user entered "65" into "Maximal Melting Temperature of primers" input
        And user opened "Database" dropdown and selected "Refseq representative genomes" in dropdown menu
        When user clicks on "Get primers" button
        Then label "Error" should become visible
        Examples: 
           | invalid_input            |
           | ""                       |
           | invalidinput12345        |
           | GGGGGGGTTTTTTTGGGGGTGTGT |
        #is there a way to pass an empty value to the Example table? 
        #'', [blank] and just empty field don't work(  


    @error_2
    Scenario: User can see error notification providing invalid setting
        Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
        And user entered "NG_017013.11" into "Template" input
        And user entered "0" into "Minimal Melting Temperature of primers" input
        And user entered "62" into "Optimal Melting Temperature of primers" input
        And user entered "1" into "Maximal Melting Temperature of primers" input
        And user opened "Database" dropdown and selected "Refseq representative genomes" in dropdown menu
        When user clicks on "Get primers" button
        Then label "Error" should become visible    
    
    @error_3    
    Scenario: User can see error notification providing empty input
        Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
        And user entered "59" into "Minimal Melting Temperature of primers" input
        And user entered "62" into "Optimal Melting Temperature of primers" input
        And user entered "65" into "Maximal Melting Temperature of primers" input
        And user opened "Database" dropdown and selected "Refseq representative genomes" in dropdown menu
        When user clicks on "Get primers" button
        Then label "Error" should have "Exception error: No sequence input was provided . " text