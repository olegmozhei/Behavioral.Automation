Feature: Error Label
	Source: https://www.minipcr.com/what-are-pcr-primers/
	PCR primers are the key ingredient that makes one PCR different from another
	Software product - https://www.ncbi.nlm.nih.gov/tools/primer-blast/

Scenario: primers design
	Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/index.cgi?" is opened
	And user entered CCCCTTGATAAAGCACCCCGCTCGGGTATGGCAGAGAGGACGCCTTCTGAATTGTGCTATCCCTCGACCTTATCAAAGCTTGCTACCAATAATTAGGATTATTGCCTTGCGACAGACCTCCTACTCAGACTGCCTCACATTGAGCTAGTCAGTGAGCGATAAGCTTGACCCGCTTTCTAGGGTCGCGAGTACGTGAACTAGGGCTCCGGACAGGGCTATATACTCGAGTTTGATCTCGCCCCGACAACTGCAAACCTCAACTTTTTTAGATAATATGGTTAGCCGAAGTTGCACGAGGTGCCGTCCGCGGACTGCTCCCCGGGTGTGGCTCCTTCATCTGACAACGTGCAACCCCTATCGCCATCGATTGTTTCTGCGGACGGTGTTGTCCTCATAGTTTGGGCATGTTTCCCTTGTAGGTGTGAAACCACTTAGCTTCGCGCCGTAGTCCTAAAGGAAAACCTATGGACTTTGTTTCGGGTAGCACCAGGAATCTGAAC into "Template" input
	And user opened "Database" dropdown and selected "Refseq representative genomes" in dropdown menu
	And user entered .+? into "Template" input
	When user clicks on "Get Primers" button
	Then page title should become "Primer-Blast results"
	
	