Feature: NCBI_tests
Primers are short DNA sequences that can be used to amplify parts of DNA
software product - https://www.ncbi.nlm.nih.gov/tools/primer-blast/

# The first requirement 		
 Scenario: User can start design	
	Given application URL is opened
	And user entered "TTAAACGGGAGTTCGCGCTCATAACTTGGTCCGAATGCGGGTTCTTGCATCGTTCGACTGAGTTTGTTTCATGTAGAACGGGCGCAAAGTATACTTAGTTCAATCTTCAATACCTCGTATCATTGTACACCTGCCGGTCACCACCCAACGATGTGGGGACGGCGTTGCAACTTCGAGGACCTAATCTGACCGACCTAGATTCGGCACTGTGGGCAATATGAGGTATTGGCAGACACCCAGTGCCGAACAACACCTGACCTAACGGTAAGAGAGTCTCATAATGCGTCCGGCCGCGTGCCCAGGGTATATTTGGACAGTATCGAATGGACTGAGATGAACCTTTACACCGATCCGGAAACGGGTGCGTGGATTAGCCAGGAGCAAACGAAAAATCCTGGGCTACTTGATGTCTTGTGACGTTCTTAGAGATGGACGAAATGTTTCACGACCTAGGATAAGGTCGCCCTACAAAATAGATTTGTGCTACTCTCCTCATAAGCAGTCCGGTGTATCGAAAGAACAAGACTAGCCTTGCTAGCAACCGCGGGCTGGGGGGCTAAGGTATCACTCAAGAAGCAGGCTCGGTAACATACGGTCTAGCTATCTGACTATCGCCTACGTCATATAGGGACCTATGATATCTGCGTGTCCAACCTTAGAATTCACTTCAGCGCGCAGGTTTGGGTCGAGATAAAATCACCAGTACCCAAGACCACGGGCGCTCGGCGCCTTGGCTAATCCCGGTACATGTTGTTATAAATAATCAGTAGAAAATCTGTGTTAGAGGGTCGAGTCACCATATATCAAGAACGATATTAATCGGTGGGAGTATTCAACGTGATGAAGACGCTGGGTTTACGTGGGAATGGTGCTTCTGTCCTAACAGGCTAGGGTATAATGCTGAAACCGTCCCCCAAGCGTTCAGGGTGGGGTTTGCTACGACTTCCGAGTCCAAAGTGTCCGTGTTTTTGATATATACGCTCAAGGGCGAGAATTGGAC" into "Template" input
	When user opens "Database" dropdown and selects "Refseq representative genomes" in dropdown menu
	When user clicks on "Get primers" button
	Then page title should become "Primer-Blast results"
	
# The second requirement 	
 Scenario: User can see primers pairs with their attributes
	Given application URL is opened
	And user entered "TTAAACGGGAGTTCGCGCTCATAACTTGGTCCGAATGCGGGTTCTTGCATCGTTCGACTGAGTTTGTTTCATGTAGAACGGGCGCAAAGTATACTTAGTTCAATCTTCAATACCTCGTATCATTGTACACCTGCCGGTCACCACCCAACGATGTGGGGACGGCGTTGCAACTTCGAGGACCTAATCTGACCGACCTAGATTCGGCACTGTGGGCAATATGAGGTATTGGCAGACACCCAGTGCCGAACAACACCTGACCTAACGGTAAGAGAGTCTCATAATGCGTCCGGCCGCGTGCCCAGGGTATATTTGGACAGTATCGAATGGACTGAGATGAACCTTTACACCGATCCGGAAACGGGTGCGTGGATTAGCCAGGAGCAAACGAAAAATCCTGGGCTACTTGATGTCTTGTGACGTTCTTAGAGATGGACGAAATGTTTCACGACCTAGGATAAGGTCGCCCTACAAAATAGATTTGTGCTACTCTCCTCATAAGCAGTCCGGTGTATCGAAAGAACAAGACTAGCCTTGCTAGCAACCGCGGGCTGGGGGGCTAAGGTATCACTCAAGAAGCAGGCTCGGTAACATACGGTCTAGCTATCTGACTATCGCCTACGTCATATAGGGACCTATGATATCTGCGTGTCCAACCTTAGAATTCACTTCAGCGCGCAGGTTTGGGTCGAGATAAAATCACCAGTACCCAAGACCACGGGCGCTCGGCGCCTTGGCTAATCCCGGTACATGTTGTTATAAATAATCAGTAGAAAATCTGTGTTAGAGGGTCGAGTCACCATATATCAAGAACGATATTAATCGGTGGGAGTATTCAACGTGATGAAGACGCTGGGTTTACGTGGGAATGGTGCTTCTGTCCTAACAGGCTAGGGTATAATGCTGAAACCGTCCCCCAAGCGTTCAGGGTGGGGTTTGCTACGACTTCCGAGTCCAAAGTGTCCGTGTTTTTGATATATACGCTCAAGGGCGAGAATTGGAC" into "Template" input
	And user entered "15" into "Forward primer from" input
	And user entered "80" into "Forward primer to" input
	And user entered "750" into "Reverse primer from" input
	And user entered "900" into "Reverse primer to" input
	And user entered "20" into "Number of primers to return" input
	And user entered "2" into "Maximal Melting Temperature difference" input
	And user entered "55" into "Minimal Melting Temperature of primers" input
	And user entered "57" into "Optimal Melting Temperature of primers" input
	And user entered "65" into "Maximal Melting Temperature of primers" input
	And user entered "71" into "Minimal size of PCR product" input
	And user entered "1001" into "Maximal size of PCR product" input
	And "Perform specificity check" checkbox is unchecked
	When user clicks on "Get primers" button
	Then "Primers design" table should become visible
	And "Primers design" table should have the following rows:
	  | Sequence (5'->3')    | Length | Tm    |
	  | GCATCGTTCGACTGAGTTTG | 20     | 57.51 |
	
	
 # The third requirement 	
 Scenario: Error message (left boundary)
	Given application URL is opened
	And user entered "TTAAACGGGATTAAACGGGATTAAACGGGATTAAACGGGATTAAACGGGATTAAACGGGATTAAACGGG" into "Template" input
	And user entered "2" into "Maximal Melting Temperature difference" input
	And "Perform specificity check" checkbox is unchecked
	And user clicked on "Get primers" button
	Then label "Error" should become visible
	
 # The fourth requirement
 Scenario: Primers' evaluation
 	Given application URL is opened
 	And user entered "NC_001354.1" into "Template" input
 	And user entered "ACCTACAGGCGGCCTACTAA" into "Forward primer" input
 	And user entered "CTAAATCCTTGCGCTTCCGC" into "Reverse primer" input
 	And "Perform specificity check" checkbox is unchecked
 	When user clicks on "Get primers" button
 	Then "Primers design" table should become visible
 	And "Primers design" table should have the following rows:
      | Sequence (5'->3')    | Length | Tm    |
      | ACCTACAGGCGGCCTACTAA | 20     | 60.03 |
	
 # The fifth requirement
 Scenario: User can design primers basing on template accession number (RNA) and using exon-exon junction attribute
 	Given application URL is opened
 	And user entered "NM_000600.5" into "Template" input
 	And user opened "Exon Junction span" dropdown and selected "Primer may not span an exon-exon junction" in dropdown menu
 	And "Perform specificity check" checkbox is unchecked
 	When user clicks on "Get primers" button
	Then "Primers design" table should become visible
	 And "Primers design" table should have the following rows:
	   | Sequence (5'->3')    | Length | Tm    |
	   | CCACCGGGAACGAAAGAGAA | 20     | 59.97 |