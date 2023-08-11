Feature: PCR Primer Design
wiki: https://de.wikipedia.org/wiki/Primerdesign
DNA sequencing is used to read DNA (A, C, T, G nucleotides)
PCR is used to amplify little part of DNA (for example, 1000 bps)
	
	Background:
		Given application URL is opened
    
	
	Scenario: User opens main page with "Primer designing tool" title
		When user opens URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/"
		Then page title should become "Primer designing tool"
		
    Scenario: User provide valid input in template input.
	    Given user entered "TCCTCTCATAAGCAGTCCGGTGTATCGAAAGAACAAGACTAGCCTTGCTAGCAACCGCGGGCTGGGGGGCTAAGGTATCACTCAAGAAGCAGGCTCGGTAACATACGGTCTAGCTATCTGACTATCGCCTACGTCATATAGGGACCTATGATATCTGCGTGTCCAACCTTAGAATTCACTTCAGCGCGCAGGTTTGGGTCGAGATAAAATCACCAGTACCCAAGACCACGGGCGCTCGGCGCCTTGGCTAATCCCGGTACATGTTGTTATAAATAATCAGTAGAAAATCTGTGTTAGAGGGTCGAGTCACCATATATCAAGAACGATATTAATCGGTGGGAGTATTCAACGTGATGAAGACGCTGGGTTTACGTGGGAATGGTGCTTCTGTCCTAACAGGCTAGGGTATAATGCTGAAACCGTCCCCCAAGCGTTCAGGGTGGGGTTTGCTACGACTTCCGAGTCCAAAGTGTCCGTGTTTTTGATATATACGCTCAAGGGCGAGAATTGGACCTGGCTTACGTCTTAGTACGTAGCATGGTGACACAAGCACAGTAGATCCTGCCCGCGTTTCCTATATATTAAGTTAAATCTTATGGAATATAATAACATGTGGATGGCCAGTGGTCGGTTGTTACACGCCTACCGCAATGCTGAAAGACCCGGACTAGAGTGGCGAGATCTATGGCGTGTGACCCGTTATGCTCCATTTCGGTCAGTGGGTCACAGCTAGTTGTGGATTGGATTGCCATTCTCCGAGTGTTTTAGCGTGACAGCCGCAGGGATCCCATAAAATGCAATCGTAGTCCACCTGATCGTACTTAGAAATGAGGGTCCGCTTTTGCCCACGCACCTGATCGCTCCTCGTTTGCTTTTAAGAACCGGACGAACCACAGAGCATAAGGAGAACCTCTAGCTGCTTTACAAAGTACTGGTTCCCTTTCCAGCGGGATGCTTTATCTAAACGCAATGAGAGAGGAGTGTGCAGATGGCGCCACGAGTTACTGGCCCTGATTTCTCCGCTTCTAATACCGCACACTGGGCAATACGAGCTCAAGCCAGTCTCGCAGTAACGCTCATCAGCTAACGAAAGAGTTAGAGGCTCGCTAAATCGCACTGTCGGGGTCCCTTGGGTATTTTACACTAGCGTCAGGTAGGCTAGCATGTGTCTTTCCTTCCAGGGGTATGCGGGTGCGTGGACAAATGAGCAGCATACGTATTTACTCGGCGTGCTTGGTCTCTCGTATTTCTCCTGGAGATCAAGGAAATGTTTCATGT" into "Template" input
	    When user enters "1000" into "Forward primer from" input
	    And user clicks on "Perform specificity check" checkbox
	    And user clicks on "Get primers" button
	    Then "Primers design" table should become visible
        
    Scenario: User left template input empty
        When user clicks on "Perform specificity check" checkbox
        And user clicks on "Get primers" button
        Then label "Error" should have "Exception error: No sequence input was provided ." text
    
	Scenario: User provided "space" input
		Given user entered "                            " into "Template" input
		And "Perform specificity check" checkbox is unchecked
		When user clicks on "Get primers" button
		Then label "Error" should become visible
		
	Scenario: Template input contains unexpected symbols
		Given user entered "@#@CGACCCTAGGTTCT12332AACCGTCGACT312TTGGCGGAAAGGTTTC#@#@#""!@"#!CGACCCTAGGTTCTAACCGT0897CGACTTTGGCGGAAAGGTTTCATT"@#%%%" into "Template" input
		When user enters "1000" into "Forward primer from" input
		And user clicks on "Perform specificity check" checkbox
		And user clicks on "Get primers" button
		Then label "Error" should have "Exception error: CFastaReader: Near line 1, there's a line that doesn't look like plausible data, but it's not marked as defline or comment. ." text
	
	Scenario: Another test for invalid input, with random words.
		Given user entered "Some sort of string" into "Template" input
		And "Perform specificity check" checkbox is unchecked
		When user clicks on "Get primers" button
		Then label "Error" should become visible
		
    Scenario: User can start primers design with modified settings (minimal PCR product size) and get a table of primers
	    Given user entered "TCTCATAAGCAGTCCGGTGTATCGAAAGAACAAGACTAGCCTTGCTAGTCTCATAAGCAGTCCGGTGTATCGAAAGAACAAGACTAGCCTTGCTAGCAACCGCGGGCTGGGGGGCTAAGGTATCACTCAAGAAGCAGGCTCGGTAACATACGGTCTAGCTATCTGACCAACCGCGGGCTGGGGGGCTAAGGTATCACTCAAGAAGCAGGCTCGGTAACATACGGTCTAGCTATCTGAC" into "Template" input
        And user entered "51" into "Minimal size of PCR product" input
        When user clicks on "Get primers" button
        Then page title should become "Primer-Blast results"
        And "Primers design" table should become visible within "150" seconds 
    
	Scenario: Design primers with one character in DNA template
		Given user entered "G" into "Template" input
		When user clicks on "Get primers" button
		Then page title should become "Primer-Blast results"
		And label "Error" should become visible
	
	Scenario: Test for reverse primer
		Given user entered "U49845" into "Template" input
		When user enters "AATGGGATAGCAACACCGCA" into "Reverse primer" input
		And user clicks on "Perform specificity check" checkbox
		And user clicks on "Get primers" button
		Then "Primers design" table should become visible
		
	Scenario: Test for forward primer
		Given user entered "U49845" into "Template" input
		When user enters "AACCACAGTGCGAATGCAAC" into "Forward primer" input
		And user clicks on "Perform specificity check" checkbox
		And user clicks on "Get primers" button
		Then "Primers design" table should become visible

	Scenario: Test for forward primer and reverse primer 
		Given user entered "U49845" into "Template" input
		When user enters "AATGGGATAGCAACACCGCA" into "Reverse primer" input
		And user enters "AACCACAGTGCGAATGCAAC" into "Forward primer" input
		And user clicks on "Perform specificity check" checkbox
		And user clicks on "Get primers" button
		Then "Primers design" table should become visible
	
	Scenario: Test specify "must span" exon-exon junction attribute
		Given user entered "NM_000200.3" into "Template" input
		And user opened "Exon Junction span" dropdown and selected "Primer must span an exon-exon junction" in dropdown menu
		When user clicks on "Perform specificity check" checkbox
		And user clicks on "Get primers" button
		Then "Primers design" table should become visible
		
	Scenario: Test specify "may not span" exon-exon junction attribute/
		Given user entered "NM_000200.3" into "Template" input
		And user opened "Exon Junction span" dropdown and selected "Primer may not span an exon-exon junction" in dropdown menu
		When user clicks on "Perform specificity check" checkbox
		And user clicks on "Get primers" button
		Then "Primers design" table should become visible
		
	Scenario: Test specify "may not span" exon-exon junction attribute with "Forward primer" input
		Given user entered "NM_000200.3" into "Template" input
		And user opened "Exon Junction span" dropdown and selected "Primer must span an exon-exon junction" in dropdown menu
		When user clicks on "Perform specificity check" checkbox
		And user enters "GCATCATTCACATCGAGGCT" into "Forward primer" input
		And user clicks on "Get primers" button
		Then "Primers design" table should become visible
	
	Scenario: Test specify "may not span" exon-exon junction attribute with "Reverse primer" input
		Given user entered "NM_000200.3" into "Template" input
		And user opened "Exon Junction span" dropdown and selected "Primer must span an exon-exon junction" in dropdown menu
		When user clicks on "Perform specificity check" checkbox
		And user enters "TGCCCCGTGATTACTGAAGA" into "Reverse primer" input
		And user clicks on "Get primers" button
		Then "Primers design" table should become visible
	