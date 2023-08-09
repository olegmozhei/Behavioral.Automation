Feature: Providing PCR template
As a user
In order to get primers for PCR (https://en.wikipedia.org/wiki/Polymerase_chain_reaction)
I want to provide a PCR template (FASTA sequence, FASTA file, refseq accession)

    Background:
        Given application URL is opened

    @Reference:ProvidingPCRTemplate
    Scenario: Providing PCR template using FASTA sequence
        Given user entered "CGTCCAAACCCAGCTCTATTTTAGTGGTCATGGGTTCTGGTCCCCCCGAGCGGCGCAACCGATTAGGACCATGTAGAACATTACTTATAAGTCATCTTTTAAACACAATCTTCCTGCTCAGTGGTACATGGTTTTCGCTATAGCTAGCCACCCTCATAAGTAGCACCACTTCTGCGACCCAAATGCACCCTTTCCACGAACACAGGGTTGTCCGATCCTATATTACGACTTCGGGAAGGGGTTCGCAAGTCCCACCCTAAACGATGTTGAAGGCTCAGGTTACACAGGCACAAGTACTATATATACGTGTTCCGGCTCTTAACCTGGATCGAAAGCACAATCATGCATCGTACCAGTGTGTTCGTGTCATCTAGGACGGGCGCATAGGATATATAATTCAATTAAGAATACCTTATACTACTGTACACCTACCCGTCACCGGCCAACAATGTGCGGATGGCGCTACGACTTACTGGGCCTGATTTCACCGCTTTTAATACCGCACACTGGGCAATACGAGGTCAAGCCAGTCACCCAGTAACGTTCATCAGCTAACGTAACGGTTAGAGGCTCACTAAATCGCACTGTCGGCGTCCCTTGGGTATTTTACGTTAGCATCAGGTAGACTAGCATGTATCTTTACTCCCAGGGGAATACGGGTGCGTGGACAAGCGAGCAGCAAACGTAAATTCTCGGCGTGCTTGGTGTCTCGTATTTCTCTTGGAGATCGAGGAAATGTTTCATGACCAAGGGAAAGGTCGCCCTACGGAATAGATTTGCGTTACTGCCTGCATAAGGAGTCCGGTGTAGCCAAGGACGAAGGCGACCCTAGGTAGTAACCGTCGGCTTCGGCGGTAAGGTATCACTCAGGAAGCAGACACAGATAGACACGGTCTAGCAGATCGTTTAACGACTAGGTCAAATAGAGTGCTTTGATATCGGCATGTCTGGCTTTAGAATTCAGTATAGTGCGCTGATCCGAGTCGAGATAAAAACACCA" into "Template" input
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible

    @Reference:ProvidingPCRTemplate
    Scenario: Providing PCR template using FASTA file
        Given "Perform specificity check" checkbox is unchecked
        When user uploads "TestData/CFTR_mRNA_sequence.fasta" after clicking on "Choose template file" button
        And user clicks on "Get primers" button
        Then "Primers design" table should become visible

    @Reference:ProvidingPCRTemplate
    Scenario: Providing DNA template using refseq accession and existing primers
        Given user entered "NM_002046.7" into "Template" input
        And user entered "GAGAAGGCTGGGGCTCATTT" into "Forward primer" input
        And user entered "AGTGATGGCATGGACTGTGG" into "Reverse primer" input
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible

    @Reference:ProvidingPCRTemplate
    Scenario: Providing PCR template using refseq accession
        Given user entered "NM_002046.7" into "Template" input
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible

    @Reference:ProvidingPCRTemplate
    Scenario: Providing PCR template to get primers from the chosen area
        Given user entered "CGTCCAAACCCAGCTCTATTTTAGTGGTCATGGGTTCTGGTCCCCCCGAGCGGCGCAACCGATTAGGACCATGTAGAACATTACTTATAAGTCATCTTTTAAACACAATCTTCCTGCTCAGTGGTACATGGTTTTCGCTATAGCTAGCCACCCTCATAAGTAGCACCACTTCTGCGACCCAAATGCACCCTTTCCACGAACACAGGGTTGTCCGATCCTATATTACGACTTCGGGAAGGGGTTCGCAAGTCCCACCCTAAACGATGTTGAAGGCTCAGGTTACACAGGCACAAGTACTATATATACGTGTTCCGGCTCTTAACCTGGATCGAAAGCACAATCATGCATCGTACCAGTGTGTTCGTGTCATCTAGGACGGGCGCATAGGATATATAATTCAATTAAGAATACCTTATACTACTGTACACCTACCCGTCACCGGCCAACAATGTGCGGATGGCGCTACGACTTACTGGGCCTGATTTCACCGCTTTTAATACCGCACACTGGGCAATACGAGGTCAAGCCAGTCACCCAGTAACGTTCATCAGCTAACGTAACGGTTAGAGGCTCACTAAATCGCACTGTCGGCGTCCCTTGGGTATTTTACGTTAGCATCAGGTAGACTAGCATGTATCTTTACTCCCAGGGGAATACGGGTGCGTGGACAAGCGAGCAGCAAACGTAAATTCTCGGCGTGCTTGGTGTCTCGTATTTCTCTTGGAGATCGAGGAAATGTTTCATGACCAAGGGAAAGGTCGCCCTACGGAATAGATTTGCGTTACTGCCTGCATAAGGAGTCCGGTGTAGCCAAGGACGAAGGCGACCCTAGGTAGTAACCGTCGGCTTCGGCGGTAAGGTATCACTCAGGAAGCAGACACAGATAGACACGGTCTAGCAGATCGTTTAACGACTAGGTCAAATAGAGTGCTTTGATATCGGCATGTCTGGCTTTAGAATTCAGTATAGTGCGCTGATCCGAGTCGAGATAAAAACACCA" into "Template" input
        And user entered "10" into "Forward primer from" input
        And user entered "90" into "Forward primer to" input
        And user entered "600" into "Reverse primer from" input
        And user entered "1000" into "Reverse primer to" input
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible

    @Reference:NegativeCase
    @Reference:ProvidingPCRTemplate
    Scenario: Providing PCR template and choosing inappropriate area
        Given user entered "CGTCCAAACCCAGCTCTATTTTAGTGGTCATGGGTTCTGGTCCCCCCGAGCGGCGCAACCGATTAGGACCATGTAGAACATTACTTATAAGTCATCTTTTAAACACAATCTTCCTGCTCAGTGGTACATGGTTTTCGCTATAGCTAGCCACCCTCATAAGTAGCACCACTTCTGCGACCCAAATGCACCCTTTCCACGAACACAGGGTTGTCCGATCCTATATTACGACTTCGGGAAGGGGTTCGCAAGTCCCACCCTAAACGATGTTGAAGGCTCAGGTTACACAGGCACAAGTACTATATATACGTGTTCCGGCTCTTAACCTGGATCGAAAGCACAATCATGCATCGTACCAGTGTGTTCGTGTCATCTAGGACGGGCGCATAGGATATATAATTCAATTAAGAATACCTTATACTACTGTACACCTACCCGTCACCGGCCAACAATGTGCGGATGGCGCTACGACTTACTGGGCCTGATTTCACCGCTTTTAATACCGCACACTGGGCAATACGAGGTCAAGCCAGTCACCCAGTAACGTTCATCAGCTAACGTAACGGTTAGAGGCTCACTAAATCGCACTGTCGGCGTCCCTTGGGTATTTTACGTTAGCATCAGGTAGACTAGCATGTATCTTTACTCCCAGGGGAATACGGGTGCGTGGACAAGCGAGCAGCAAACGTAAATTCTCGGCGTGCTTGGTGTCTCGTATTTCTCTTGGAGATCGAGGAAATGTTTCATGACCAAGGGAAAGGTCGCCCTACGGAATAGATTTGCGTTACTGCCTGCATAAGGAGTCCGGTGTAGCCAAGGACGAAGGCGACCCTAGGTAGTAACCGTCGGCTTCGGCGGTAAGGTATCACTCAGGAAGCAGACACAGATAGACACGGTCTAGCAGATCGTTTAACGACTAGGTCAAATAGAGTGCTTTGATATCGGCATGTCTGGCTTTAGAATTCAGTATAGTGCGCTGATCCGAGTCGAGATAAAAACACCA" into "Template" input
        And user entered "5" into "Forward primer from" input
        And user entered "50" into "Forward primer to" input
        And user entered "40" into "Reverse primer from" input
        And user entered "100" into "Reverse primer to" input
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then label "Error" should have "Forward primer range may not overlap with reverse primer range: forward from = 5, forward to = 50, reverse from = 40, reverse to = 100." text

    @Reference:NegativeCase
    @Reference:ProvidingPCRTemplate
    Scenario: Providing inappropriate PCR template
        Given user entered "CGTCCAAACCCAGCTCTATTTTAGTGGTCATGGGT" into "Template" input
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then label "Error" should have "PCR template length (35) is shorter than specified product min length 70. Effective template length (35) is shorter than specified product length ( 70)." text

    @Reference:NegativeCase
    @Reference:ProvidingPCRTemplate
    Scenario: Providing blank PCR template
        Given user entered " " into "Template" input
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then label "Error" should have "Exception error: No sequence input was provided . " text