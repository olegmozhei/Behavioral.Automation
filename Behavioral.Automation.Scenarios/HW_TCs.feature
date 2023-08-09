Feature: Sequence
	Source: https://www.minipcr.com/what-are-pcr-primers/
	PCR primers are the key ingredient that makes one PCR different from another
	Software product - https://www.ncbi.nlm.nih.gov/tools/primer-blast/

Scenario: User can run primers design
	Given application URL is opened
	And user entered "ATACCACCATATCATTCGAGCATGACACTATCTGCGCTGTCCCCATCCTGGTAGTCATTATTCCTATCACGCTTTCGAGTGACTGGTGACGGATATCCCCCACGAATGAAAATCTTTTTCACTGACAGTCATATTGGGGTGCTCCTAAGCTTTTCCACTTGGCTGGGTCTGCTAGGCCTCCGTGCCCGGAGTTTCGGCGC" into "Template" input	
	And "Perform specificity check" checkbox is unchecked
	When user clicks on "Get primers" button
	Then "Primers design" table should become visible
	
Scenario: primers to amplify DNA can be designed	
	Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
	And user entered "TAATATGTTGACCCCTGTATTAGGGATGCGGGTAGTAGATGAGCGCAGGGACACCGAGGTCAAGTACATTACCCTCTCATAGGAGGTGTTCTAGATCACC" into "Template" input
	And user opened "Database" dropdown and selected "Refseq representative genomes" in dropdown menu
	When user clicks on "Perform specificity check" checkbox
	And user clicks on "Get primers" button
	Then "Primers design" table should become visible
	
	Scenario: Sequence_mistake
	Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
	And user entered "CCCCTTGATAAAGCACCCCGCTCGGGTATGGCAGAGAGGACGCCTTCTGAATTGTGCTATCCCTCGACCTTATCAAAGCTTGCTACCAATAATTAGGATTATTGCCTTGCGACAGACCTCCTACTCAGACTGCCTCACATTGAGCTAGTCAGTGAGCGATAAGCTTGACCCGCTTTCTAGGGTCGCGAGTACGTGAACTAGGGCTCCGGACAGGGCTATATACTCGAGTTTGATCTCGCCCCGACAACTGCAAACCTCAACTTTTTTAGATAATATGGTTAGCCGAAGTTGCACGAGGTGCCGTCCGCGGACTGCTCCCCGGGTGTGGCTCCTTCATCTGACAACGTGCAACCCCTATCGCCATCGATTGTTTCTGCGGACGGTGTTGTCCTCATAGTTTGGGCATGTTTCCCTTGTAGGTGTGAAACCACTTAGCTTCGCGCCGTAGTCCTAAAGGAAAACCTATGGACTTTGTTTCGGGTAGCACCAGGAATCTGAAC" into "Template" input
	And "Perform specificity check" checkbox is unchecked
	And user opened "Database" dropdown and selected "Refseq representative genomes" in dropdown menu
	And user entered " " into "Template" input
	When user clicks on "Get Primers" button
	Then label "Error" should have "Exception error: No sequence input was provided." text
		
Scenario: accession number (DNA)	
	Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
	And user entered "NC_001531.1" into "Template" input
	And user entered "TGCAAAAACGGTCAAGCGAG" into "Forward primer" input
	And user entered "AGACGATTCCCCTTGTGCTG" into "Reverse primer" input
	And "Perform specificity check" checkbox is unchecked
	When user enters "57" into "Minimal Melting Temperature of primers" input
	And user enters "59" into "Optimal Melting Temperature of primers" input
	And user enters "63" into "Maximal Melting Temperature of primers" input
	And user enters "4" into "Maximal Melting Temperature difference" input
	When user clicks on "Get Primers" button
	Then "Primers design" table should become visible
  		
Scenario: accession number (RNA)
	Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
	And user entered "NM_005330.3" into "Template" input
	And "Perform specificity check" checkbox is unchecked
	When user opens "Exon junction span" dropdown and selects "Primer must span an exon-exon junction" in dropdown menu
	And user enters "10" into "Min Site overlap by five prime end" input
	And user enters "5" into "Min Site overlap by three prime end" input
	And user enters "12" into "Max Site overlap by three prime end" input
	When user opens "Database" dropdown and selects "Refseq mRNA" in dropdown menu
	And user clicks on "Get Primers" button
	Then "Primers design" table should become visible
	


	