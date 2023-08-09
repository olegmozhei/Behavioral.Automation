Feature: ExonIntronSelection
As a user
In order to get specific primers on my mRNA template
I want to choose from different options:
- with one end mapping to one exon, and the other end mapping to another exon, thus spanning the intermediate intron.
and choose a minimal and maximal number of bases that must anneal to exons
- exclude such primers in case of amplifying mRNA as well as the corresponding genomic DNA.

    Background:
        Given application URL is opened

    @Reference:ExonIntronSelection
    Scenario: Providing mRNA template to specify exon junction span
        Given user entered "NM_000600.5" into "Template" input
        And user opened "Exon Junction span" dropdown and selected "Primer must span an exon-exon junction" in dropdown menu
        And user entered "2" into "Min site overlap by five prime end" input
        And user entered "2" into "Min site overlap by three prime end" input
        And user entered "5" into "Max site overlap by three prime end" input
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible

    @Reference:ExonIntronSelection
    Scenario: Providing mRNA template to specify primer which may not span exon junction
        Given user entered "NM_000600.5" into "Template" input
        And user opened "Exon Junction span" dropdown and selected "Primer may not span an exon-exon junction" in dropdown menu
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible

    @Reference:NegativeCase
    @Reference:ExonIntronSelection
    Scenario: Providing mRNA template to specify exon junction span with inappropriate input
        Given user entered "NM_002046" into "Template" input
        And user opened "Exon Junction span" dropdown and selected "Primer must span an exon-exon junction" in dropdown menu
        And user entered "100" into "Min site overlap by five prime end" input
        And user entered "0" into "Min site overlap by three prime end" input
        And user entered "1" into "Max site overlap by three prime end" input
        And "Perform specificity check" checkbox is unchecked
        When user clicks on "Get primers" button
        Then label "Error" should have "Please correct the following errors: Illegal value for PRIMER_MIN_3_PRIME_OVERLAP_OF_JUNCTION." text