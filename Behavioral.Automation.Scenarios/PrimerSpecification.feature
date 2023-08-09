Feature: PrimerSpecification
As a user
In order to get the most convenient primers (primers should generally have the following properties:
    -Length of 18-24 bases
    -40-60% G/C content
    -Start and end with 1-2 G/C pairs
    -Melting temperature (Tm) of 50-60°C
    -Primer pairs should have a Tm within 5°C of each other
    -Primer pairs should not have complementary regions)
I want to specify primer parameters and specify my own primers

    Background:
        Given application URL is opened

    @Reference:PrimerSpecification
    Scenario: Specifying primer parameters
        Given user entered "NM_002046.7" into "Template" input
        And user entered "69" into "Minimal size of PCR product" input
        And user entered "999" into "Minimal size of PCR product" input
        And user entered "20" into "Number of primers to return" input
        And user entered "50" into "Minimal Melting Temperature of primers" input
        And user entered "55" into "Optimal Melting Temperature of primers" input
        And user entered "60" into "Maximal Melting Temperature of primers" input
        And user entered "2" into "Maximal Melting Temperature difference" input
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible

    @Reference:PrimerSpecification
    Scenario: Specifying existing primers
        Given user entered "GCAAGTCCCACCCTAAACGA" into "Forward primer" input
        And user entered "CGTTACTGGGTGACTGGCTT" into "Reverse primer" input
        And user entered "51" into "Minimal Melting Temperature of primers" input
        And user entered "58" into "Optimal Melting Temperature of primers" input
        And user entered "63" into "Maximal Melting Temperature of primers" input
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible

    @Reference:NegativeCase
    @Reference:PrimerSpecification
    Scenario: Providing inappropriate existing primers
        Given user entered "GCAAGT1" into "Forward primer" input
        And user entered "CGTTAC1" into "Reverse primer" input
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then label "Error" should have "Ambiguity letters other than N are not allowed in left primer sequence. Ambiguity letters other than N are not allowed in right primer sequence." text