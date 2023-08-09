Feature: 2d_suite
User opened main page
User provides DNA template
User specified settings for findings primers,
and user starts design and users see primer pairs and their attribute

@Reference:PrimerDesign-1
@Reference:PrimerDesign-2
	
Scenario: User provides PCR and design params and get primers.
	Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
	When user enters "AGGCGTAAACTACGATGGCACCAACTCAATCGCAGCTCGTGCGCCCTGAATAACGTACTCATCTCAACTGATTCTCGGCAATCTACGGAGCGACTTGATTATCAACAGCTGTCTAGCAGTTCTAATCTTTTGCCAACATCGTAATAGCCTCCAAGAGATTGATCATACCTATCGGCACAGAAGTGACACGACGCCGATGGGTAGCGGACTTTTGGTCAACCACAATTCCCCAGGGGACAGGTCCTGCGGTGCGCATCACTTTGTATGTGCAAGCAACCCAAGTGGGCCCAGCCTGGACTCAGCTGGTTCCTGTGTGAGCTCGAGGCTGGGGATGACAGCTCTTTAAACATAGGGCGGGGGCGTCGAACGGTCGAGAAACTCATAGTACCTCGGGTACCAACTTACTCAGGTTATTGCTTGAAGCTGTACTATTTCAGGGGGGGAGCGCTGAAGGTCTCTTCTTCTGATGACTGAACTCGCAAGGGTCGTGAAGTCGGTTC" into "Template" input
	And user enters "1" into "Forward primer from" input
	And user enters "50" into "Forward primer to" input
	And user enters "200" into "Reverse primer from" input
	And user enters "300" into "Reverse primer to" input
	And user clicks on "Get primers" button
	Then "Primers design" table should become visible within "6000" seconds
	
Scenario: User provides PCR and design params and get primers (perform specificity checkbox inactive)
	Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
	When user enters "AGGCGTAAACTACGATGGCACCAACTCAATCGCAGCTCGTGCGCCCTGAATAACGTACTCATCTCAACTGATTCTCGGCAATCTACGGAGCGACTTGATTATCAACAGCTGTCTAGCAGTTCTAATCTTTTGCCAACATCGTAATAGCCTCCAAGAGATTGATCATACCTATCGGCACAGAAGTGACACGACGCCGATGGGTAGCGGACTTTTGGTCAACCACAATTCCCCAGGGGACAGGTCCTGCGGTGCGCATCACTTTGTATGTGCAAGCAACCCAAGTGGGCCCAGCCTGGACTCAGCTGGTTCCTGTGTGAGCTCGAGGCTGGGGATGACAGCTCTTTAAACATAGGGCGGGGGCGTCGAACGGTCGAGAAACTCATAGTACCTCGGGTACCAACTTACTCAGGTTATTGCTTGAAGCTGTACTATTTCAGGGGGGGAGCGCTGAAGGTCTCTTCTTCTGATGACTGAACTCGCAAGGGTCGTGAAGTCGGTTC" into "Template" input
	And user enters "2" into "Forward primer from" input
	And user enters "40" into "Forward primer to" input
	And user enters "200" into "Reverse primer from" input
	And user enters "300" into "Reverse primer to" input
	And user clicks on "Perform specificity check" checkbox
	And user clicks on "Get primers" button
	Then "Primers design" table should become visible within "6000" seconds
	
Scenario: User provides PCR and limit number of primers to return to 5 and get primers.
	Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
	When user enters "GGATGAGTGTCAGCCAGTGTAACCCGATGAGCTACCCAGTAGTCGAACTGGGCCAGACAACCCGGCGCTAATGCACTCAATCCCGAGGCCTGACGCGACATATCAGCTAAGAGTAGGCCGGGGGTGTAGACCTTTGGGGTTGAATAAATCTATTGTACTAATCGGCTTCAACGTGCCGCACGGGTGGCACCTCAGGAGGGGCCCACAGGGAGGAAGTAAACTGCTATTCGTCGCCGATGGTGGTAACTAATTATGTTCCTTGCCACTACAATTGTATCTAAGCCGTGTAATGAGAACATC" into "Template" input
	And user enters "5" into "Number of primers to return" input
	And user clicks on "Get primers" button
	Then "Primers design" table should become visible within "6000" seconds
# only 5 pairs of primers should be visible
	
Scenario: User can provide template as .fasta file
	Given application URL is opened
	When user uploads "TestData/CFTR_mRNA_sequence.fasta" after clicking on "Choose template file" button
	And user clicks on "Perform specificity check" checkbox
	And user clicks on "Get primers" button
	Then "Primers design" table should become visible
	
Scenario Outline: User get primers after specifying RANGE settings for finding params
	Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
	When user enters "CACACCTTAGTGAATCGATGCGCCGCTTCGGAATACCGTTTTGGCTACCTGTTACTAAGCCCATCGCGATTTTCAGGTATCGTGCACGTAGGGTTGCACCGCACGCATGTCGAACTGGTGGCGAAGTACGATTCCACGACCGGTGTACGATTCAACTACGCGGACGTGACGAGCTTCTTATATATGCTTCGCCCGCCGGA" into "Template" input
	And user enters "<fpf>" into "Forward primer from" input
	And user enters "<fpt>" into "Forward primer to" input
	And user enters "<rpf>" into "Reverse primer from" input
	And user enters "<rpt>" into "Reverse primer to" input
	And user clicks on "Perform specificity check" checkbox
	When user clicks on "Get primers" button
	Then "Primers design" table should become visible within "6000" seconds
	Examples:
	  | fpf | fpt | rpf | rpt |
	  | 1   | 50  | 150 | 200 |
	  | 2   | 50  | 50  | 150 |
