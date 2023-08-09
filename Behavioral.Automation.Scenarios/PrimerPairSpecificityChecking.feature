Feature: PrimerPairSpecificityChecking
As a user
In order to check if my primers are specific to some organism from databases
I want to have a chance to look at different databases for a match

    Background:
        Given application URL is opened

    @PrimerPairSpecificity
    Scenario Outline: Primer Pair Specificity Checking with different databases
        Given user entered "GCAAGTCCCACCCTAAACGA" into "Forward primer" input
        And user entered "CGTTACTGGGTGACTGGCTT" into "Reverse primer" input
        And user opened "Database" dropdown and selected "<database>" in dropdown menu
        When user clicks on "Get primers" button
        Then "Primers design" table should become visible within "180" seconds

        Examples:
          | database                                                          |
          | Refseq mRNA                                                       |
          | Refseq representative genomes                                     |
          | Genomes for selected eukaryotic organisms (primary assembly only) |
          | Refseq RNA (refseq_rna)                                           |
          | nr                                                                |