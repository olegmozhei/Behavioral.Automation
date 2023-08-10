Feature: Primer_Evaluation (4th requirement)
Users input DNA template accession number and their primers. 
The system generates and displays primer pairs for evaluation,
displaying relevant attributes. 
This process enables users to assess the efficacy of their known primers.

	@correct
	Scenario: User can see attributes for evaluated primers
		Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
		And user entered "NG_017013.2" into "Template" input
		And user entered "CAGCCACCTGAGTCTGCAAT" into "Forward primer" input
		And user entered "GGACGGTTGGTTCCTGAGTT" into "Reverse primer" input
		And "Perform specificity check" checkbox is unchecked
		When user clicks on "Get primers" button
		Then "Primers design" table should become visible within "180" seconds
		And "Primers design" table should have the following rows:
		  | Sequence (5'->3')    | Length | Tm    |
		  | CAGCCACCTGAGTCTGCAAT | 20     | 60.32 |
		  | GGACGGTTGGTTCCTGAGTT | 20     | 59.89 |
	
    @fail	
	Scenario Outline: User can see error notification by running primer evaluation with wrong inputs
		Given URL "https://www.ncbi.nlm.nih.gov/tools/primer-blast/" is opened
		And user entered "<template_sequence>" into "Template" input
		And user entered "<forward_primer>" into "Forward primer" input
		And user entered "<reverse_primer>" into "Reverse primer" input
		And "Perform specificity check" checkbox is unchecked
		When user clicks on "Get primers" button
		Then label "Error" should become visible 
	Examples:
	  | template_sequence   | forward_primer       | reverse_primer       | 
	  | NG_017013.2         | CAGCCACCTGAGTCTGCAAT | ''                   | 
	  | NG_123456.7         | TCGATCGATCGATCG      | CGATCGATCGATCGATCGAT | 
	  | NC_987654.3         | GCTAGCTAGCTAGCTAGCTA | TAGCTAGCTAGCTAGCTAGC | 