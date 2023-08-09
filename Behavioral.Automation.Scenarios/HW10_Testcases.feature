Feature: HW10_Testcases
List of the scenarios of test cases that cover the requirements in Homework 10
wiki: https://de.wikipedia.org/wiki/Primerdesign
DNA sequencing is used to read DNA (A, C, T, G nucleotides)
PCR is used to amplify little part of DNA (for example, 1000 bps)

	#--Line 1 requirements set-- 
Scenario: User is able to click the button Get Primers
	When user opens URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/"
	Then page title should become "Primer designing tool"
	And "Get primers" button should become visible 
		
Scenario: User can start primers design with default settings
    Given application URL is opened 
    #random 1000bps fragment below
    And user entered "GTCAAGCCAGTCACGCAGTAACGTTCATCAGCTAACGTAACAGTTAGAGGCTCGCTAAATCGCACTGTCGGCGTCCCTTGGGTATTTTACGCTAGCATCAGGTAGGCTAGCATGTATCTTTCCTCCCAGGGGTATGCGGGTGCGTGGACAAATGAGCAGCAAACGTAAATTCTCGGCGTGCTTGGTGTCTCGTATTTCTCCTGGAGATCAAGGAAATGTTTCATGACCAAGCGAAAGGCCGCTCTACGGAATGGATTTACGTTACTGCCTGCATAAGGAGACCGGTGTAGCCAAGGACGAAGGCGACCCTAGGTTCTAACCGTCGACTTCGGCGGTAAGGTATCACTCAGGAAGCAGACACTGATAGACACGGTCTAGCAGATCGTTTGACGACTAGGTCAAATTGAGTGGTTTAATATCGGCATGTCTGGCTTTAGAATTCAGTATAGTGCGCTGATCCGAGTCGAATTAAAAACACCAGTACCCAAAACCAGGCGGGCTCGCCACGTCGGCTAATCCTGGTACATTTTGTAAACAATGTTCTGAAGAAAATTTGTGAAAGAAGGACGGGTCATCGCCTACTAATAGCAACAACGATCGGCCGCACCTTCCATTGTCGTGGCGACGCTCGGATTACACGGCAAAGGTGCTTGTGTTCCGACAGGCTAGCATATAATCCTGAGGCGTTACCCCAATCGTTCACCGTCGGATTTGCTACAGCCCCTGAACGCTACATGTACGAAACCATGTTATGTATGCACTAGGCCAACAATAGGACGTAGCCTTGTAGTTAGTACGTAGCCTGGTCGCATAAGTACAGTAGATCCTCCCCGCGCATCCTATTTATTAAGTTAATTCTACAGCAAAACGATCATATGCAGATCCGCAGTGGCCGGTAGACACACGTCCACCCCGCTGCTCTGTGACAGGGACTAAAGAGGCGAAGATTATCGTGTGTGCCCCGTTATGGTCGAGTTCGGTCAGAGCGTCATTGCGAGTA" into "Template" input
    When user clicks on "Get primers" button
    Then page title should become "Primer-Blast results" 
    
Scenario: User can start primers design with unchecked Specificity block
	Given application URL is opened 
#random 1000bps fragment below
	And user entered "GTCAAGCCAGTCACGCAGTAACGTTCATCAGCTAACGTAACAGTTAGAGGCTCGCTAAATCGCACTGTCGGCGTCCCTTGGGTATTTTACGCTAGCATCAGGTAGGCTAGCATGTATCTTTCCTCCCAGGGGTATGCGGGTGCGTGGACAAATGAGCAGCAAACGTAAATTCTCGGCGTGCTTGGTGTCTCGTATTTCTCCTGGAGATCAAGGAAATGTTTCATGACCAAGCGAAAGGCCGCTCTACGGAATGGATTTACGTTACTGCCTGCATAAGGAGACCGGTGTAGCCAAGGACGAAGGCGACCCTAGGTTCTAACCGTCGACTTCGGCGGTAAGGTATCACTCAGGAAGCAGACACTGATAGACACGGTCTAGCAGATCGTTTGACGACTAGGTCAAATTGAGTGGTTTAATATCGGCATGTCTGGCTTTAGAATTCAGTATAGTGCGCTGATCCGAGTCGAATTAAAAACACCAGTACCCAAAACCAGGCGGGCTCGCCACGTCGGCTAATCCTGGTACATTTTGTAAACAATGTTCTGAAGAAAATTTGTGAAAGAAGGACGGGTCATCGCCTACTAATAGCAACAACGATCGGCCGCACCTTCCATTGTCGTGGCGACGCTCGGATTACACGGCAAAGGTGCTTGTGTTCCGACAGGCTAGCATATAATCCTGAGGCGTTACCCCAATCGTTCACCGTCGGATTTGCTACAGCCCCTGAACGCTACATGTACGAAACCATGTTATGTATGCACTAGGCCAACAATAGGACGTAGCCTTGTAGTTAGTACGTAGCCTGGTCGCATAAGTACAGTAGATCCTCCCCGCGCATCCTATTTATTAAGTTAATTCTACAGCAAAACGATCATATGCAGATCCGCAGTGGCCGGTAGACACACGTCCACCCCGCTGCTCTGTGACAGGGACTAAAGAGGCGAAGATTATCGTGTGTGCCCCGTTATGGTCGAGTTCGGTCAGAGCGTCATTGCGAGTA" into "Template" input
	And "Perform specificity check" checkbox is unchecked
	When user clicks on "Get primers" button
	Then page title should become "Primer-Blast results" 
	

Scenario: User can start primers design with modified settings (range of position of the primer)
	Given application URL is opened 
	#random 1000bps fragment below
	And user entered "GTCAAGCCAGTCACGCAGTAACGTTCATCAGCTAACGTAACAGTTAGAGGCTCGCTAAATCGCACTGTCGGCGTCCCTTGGGTATTTTACGCTAGCATCAGGTAGGCTAGCATGTATCTTTCCTCCCAGGGGTATGCGGGTGCGTGGACAAATGAGCAGCAAACGTAAATTCTCGGCGTGCTTGGTGTCTCGTATTTCTCCTGGAGATCAAGGAAATGTTTCATGACCAAGCGAAAGGCCGCTCTACGGAATGGATTTACGTTACTGCCTGCATAAGGAGACCGGTGTAGCCAAGGACGAAGGCGACCCTAGGTTCTAACCGTCGACTTCGGCGGTAAGGTATCACTCAGGAAGCAGACACTGATAGACACGGTCTAGCAGATCGTTTGACGACTAGGTCAAATTGAGTGGTTTAATATCGGCATGTCTGGCTTTAGAATTCAGTATAGTGCGCTGATCCGAGTCGAATTAAAAACACCAGTACCCAAAACCAGGCGGGCTCGCCACGTCGGCTAATCCTGGTACATTTTGTAAACAATGTTCTGAAGAAAATTTGTGAAAGAAGGACGGGTCATCGCCTACTAATAGCAACAACGATCGGCCGCACCTTCCATTGTCGTGGCGACGCTCGGATTACACGGCAAAGGTGCTTGTGTTCCGACAGGCTAGCATATAATCCTGAGGCGTTACCCCAATCGTTCACCGTCGGATTTGCTACAGCCCCTGAACGCTACATGTACGAAACCATGTTATGTATGCACTAGGCCAACAATAGGACGTAGCCTTGTAGTTAGTACGTAGCCTGGTCGCATAAGTACAGTAGATCCTCCCCGCGCATCCTATTTATTAAGTTAATTCTACAGCAAAACGATCATATGCAGATCCGCAGTGGCCGGTAGACACACGTCCACCCCGCTGCTCTGTGACAGGGACTAAAGAGGCGAAGATTATCGTGTGTGCCCCGTTATGGTCGAGTTCGGTCAGAGCGTCATTGCGAGTA" into "Template" input
	And user entered "10" into "Forward primer from" input
	When user clicks on "Get primers" button
	Then page title should become "Primer-Blast results"
	
#--Line 2 requirements set-- 
	
Scenario: User can start primers design with modified settings (minimal PCR product size) and get a table of primers
	Given application URL is opened 
#random 1000bps fragment below
	And user entered "GTCAAGCCAGTCACGCAGTAACGTTCATCAGCTAACGTAACAGTTAGAGGCTCGCTAAATCGCACTGTCGGCGTCCCTTGGGTATTTTACGC" into "Template" input
	And user entered "50" into "Minimal size of PCR product" input
	When user clicks on "Get primers" button
	Then page title should become "Primer-Blast results"
	And "Primers design" table should become visible within "150" seconds 
	#standard 60s found to be insufficient

#--Line 3 requirements set--
	
	Scenario: User is unable to design primers with an empty PCR template
		Given application URL is opened
		When user clicks on "Get primers" button
		Then page title should become "Primer-Blast results"
		And label "Error" should have "Exception error: No sequence input was provided . " text
	 
	Scenario: Design primers with too short DNA template (less than product length)
		Given application URL is opened
		And user entered "ATGC" into "Template" input
		When user clicks on "Get primers" button
		Then page title should become "Primer-Blast results"
		And label "Error" should have "PCR template length (4) is shorter than specified product min length 70. Effective template length (4) is shorter than specified product length ( 70). " text

	Scenario: Design primers with incorrect input 
		Given application URL is opened
		And user entered "NY_001" into "Template" input
		When user clicks on "Get primers" button
		Then page title should become "Primer-Blast results"
		And label "Error" should have "Exception error: CFastaReader: Near line 1, there's a line that doesn't look like plausible data, but it's not marked as defline or comment. . " text				
	

#--Line 4 requirements set-- 

	Scenario: User can provide template accession number for DNA and primers and start evaluation
		Given application URL is opened
		And user entered "NC_001457.1" into "Template" input
		And "Perform specificity check" checkbox is unchecked
		When user enters "ATGC" into "Forward primer" input
		And user enters "CGTA" into "Reverse primer" input
		And user clicks on "Get primers" button
		Then page title should become "Primer-Blast results"
		And "Primers design" table should become visible within "150" seconds 
	#standard 60s found to be insufficient 
		
#--Line 5 requirements set-- 
	Scenario: User can provide template accession number for RNA choose exon-exon junction attribute and start design
		Given application URL is opened
		And user entered "NM_001009760.1" into "Template" input
		And "Perform specificity check" checkbox is unchecked
		When user opens "Exon Junction span" dropdown and selects "Primer may not span an exon-exon junction" in dropdown menu
		And user clicks on "Get primers" button
		Then page title should become "Primer-Blast results"
		And "Primers design" table should become visible within "150" seconds 
	#standard 60s found to be insufficient 
	
#acc number dna  NC_001457.1 sample (NC_001457.1 Human papillomavirus type 4, complete genome )
#acc number rna NM_001009760.1	sample (Ovis aries growth hormone secretagogue receptor (GHSR), mRNA )