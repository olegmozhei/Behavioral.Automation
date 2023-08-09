Feature: 5th_suite
User opened main page
User provides template accession number (RNA)
User specify exon-exon junction attribute and start design
User get primer pairs and their attributes

@Reference:PrimerDesign-1
@Reference:PrimerDesign-2
	
Scenario Outline: User provides accession number RNA specify exon-exon junction attribute and get result
	Given application URL is opened
	When user enters "NM_000250" into "Template" input
	And user clicks on "Perform specificity check" checkbox
	And user opens "Exon Junction span" dropdown and selects "<span variety>" in dropdown menu
	And user enters "8" into "Min Site overlap by five prime end" input
	And user enters "5" into "Min Site overlap by three prime end" input
	And user enters "9" into "Max Site overlap by three prime end" input
	And user clicks on "Get primers" button
	Then "Primers design" table should become visible
	Examples:
	| span variety                              |
	| Primer must span an exon-exon junction    |
	| Primer may not span an exon-exon junction | 
 
Scenario Outline: User get an error after specifying exon-exon junction attribute and providing invalid Exon junction match
	Given application URL is opened
	When user enters "NM_000250" into "Template" input
	And user clicks on "Perform specificity check" checkbox
	And user opens "Exon Junction span" dropdown and selects "Primer must span an exon-exon junction" in dropdown menu
	And user enters "<1st>" into "Min Site overlap by five prime end" input
	And user enters "<2nd>" into "Min Site overlap by three prime end" input
	And user enters "9" into "Max Site overlap by three prime end" input
	And user clicks on "Get primers" button
	Then label "Error" should become visible
	Examples:
	  | 1st | 2nd |
	  | 0   | 3   |
	  | 5   | 0   |