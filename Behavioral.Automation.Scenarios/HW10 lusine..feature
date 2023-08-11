Feature: HW10_lusine
    wiki:requirements.com
    Primers are short DNA sequences that can be used to amplify parts of DNA
    
    
    
    @req1
    Scenario: user can design PCR primers using Primer-blast tool
        Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
        When user enters "TAATAAGCCCCCGTCACTGTTGGTTGAAGAGCCCAGGACGGGTTGGCCAGATGTGCGATTATATCGCTTAATGGCTCTTGGGCCGCGGTGCGTTACCTTGCAGGAATTGAGGCCGTCCGTTAATTTCCCTTGCATACATATTGCGTTTTTTTGTCTTTTTATCCGCTTACTTAGATAAGAGTGACATAGCTTCTTACCGGAGCGCCTCCGTACACAGTACGATCGCACGCCCCATGAGATCGATAGGTATACCAGGTGTCCTGTGAGCAACGAAAGCCTAAACGGGAAATACGCGGCCAAAAGTCGGTGCGAATACGAGTCGTAGCAATGTTGGTCTGGCTATGATCTACATATTTCAGGCGGTACGTCTGCTCTGGTCAGCCTCTAATGGCTCGTTAGATAGTCTAGCCGCTGGTAATCACTCGATGACCTCGGCTCCCCATTGGTGCTACGGCGATTCTTGGAGAGCCAGCTGCGATCGCTAATGTGAGGACAGTGTAATATTAGCAAGCGATAAGTCCCCAACTGGTTGTGGCCTTTTGAAAAGTGAACTTCATAACATATGCTGTCTCAC" into "Template" input
        And user opens "Database" dropdown and selects "Refseq mRNA" in dropdown menu
        And user clicks on "Perform specificity check" checkbox
        When user clicks on "Get Primers" button
        Then "Primers design " table should become visible
      
      
      @req2
 Scenario: User designs primers for DNA template with specified settings
           Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
           When user enters "TAATAAGCCCCCGTCACTGTTGGTTGAAGAGCCCAGGACGGGTTGGCCAGATGTGCGATTATATCGCTTAATGGCTCTTGGGCCGCGGTGCGTTACCTTGCAGGAATTGAGGCCGTCCGTTAATTTCCCTTGCATACATATTGCGTTTTTTTGTCTTTTTATCCGCTTACTTAGATAAGAGTGACATAGCTTCTTACCGGAGCGCCTCCGTACACAGTACGATCGCACGCCCCATGAGATCGATAGGTATACCAGGTGTCCTGTGAGCAACGAAAGCCTAAACGGGAAATACGCGGCCAAAAGTCGGTGCGAATACGAGTCGTAGCAATGTTGGTCTGGCTATGATCTACATATTTCAGGCGGTACGTCTGCTCTGGTCAGCCTCTAATGGCTCGTTAGATAGTCTAGCCGCTGGTAATCACTCGATGACCTCGGCTCCCCATTGGTGCTACGGCGATTCTTGGAGAGCCAGCTGCGATCGCTAATGTGAGGACAGTGTAATATTAGCAAGCGATAAGTCCCCAACTGGTTGTGGCCTTTTGAAAAGTGAACTTCATAACATATGCTGTCTCAC" into "Template" input
           And user enters "30" into "Numbers of primers to return" input
           And user enters "4" into "Max Tm difference" input
           And user enters "2000" into "Intron length range" input
           When user clicks on "Get Primers" button
           Then "Primers design" table should become visible
          
          
    @req3
    Scenario: User sees error notification for invalid input (using boundary technique(69) )
               Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
               When user enters "TAATAAGCCCCCGTCACTGTTGGTTGAAGAGCCCAGGACGGGTTGGCCAGATGTGCGATTATATCGCTT" into "Template" input
               And user clicks on "Get Pimers" button
               Then "Error" table should become visible
              
   @req3    
  Scenario: User sees error notification for invalid input (using Error Guess technique (leave empty) )
        Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
        When user enters "-" into "Template" input
        Then "Error" table should become visible
       
       
        @req4
        Scenario: User evaluates primers for DNA template and see attributes for designed primers
           Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
           When user enters "NM_001301717." into "Template" input
           And user enters "Primer may not span an axon-exon junction" into "Exon junction span" input
           And user clicks on "perform specificity check" checkbox
           When user clicks on "Get Primers" button
           Then "Primers design" table should become visible
          
         
           @req5
           Scenario: User evaluates primers for RNA template and see attributes for designed primers
              Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
              When user enters "NC_001352.1" into "Template" input
              And user enters "2000" into "Intron length range" input
              When user clicks on "Get Primers" button
              Then "Primers design" button should become visible
             
             
             

