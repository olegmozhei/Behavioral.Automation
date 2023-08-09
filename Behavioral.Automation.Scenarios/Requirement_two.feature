Feature: Requirement #2
	Providing DNA template to application

@requirement_2
Scenario: Happy path scenario (default settings + DNA template)
	Given application URL is opened
	When user enters "U12345" into "Template" input
	And user clicks on "Perform specificity check" checkbox
	And user clicks on "Get primers" button
	Then "Primers design" table should become visible
	
Scenario: "Minimal Melting temperature of primers" input modified
	Given application URL is opened
	When user enters "U12345" into "Template" input
	And user enters "58" into "Minimal Melting temperature of primers" input
	And user clicks on "Perform specificity check" checkbox
	And user clicks on "Get primers" button
	Then "Primers design" table should become visible
	
Scenario: "Optimal Melting temperature of primers" input modified
	Given application URL is opened
	When user enters "U12345" into "Template" input
	And user enters "62.9" into "Optimal Melting temperature of primers" input
	And user clicks on "Perform specificity check" checkbox
	And user clicks on "Get primers" button
	Then "Primers design" table should become visible

Scenario: "Maximal Melting temperature of primers" input modified
	Given application URL is opened
	When user enters "U12345" into "Template" input
	And user enters "65" into "Maximal Melting temperature of primers" input
	And user clicks on "Perform specificity check" checkbox
	And user clicks on "Get primers" button
	Then "Primers design" table should become visible