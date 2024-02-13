Feature: Example2
Second feature file to demonstrate multithreading

  @mytag
  Scenario: User can provide template as .fasta file
    Given application URL is opened
    When user uploads "TestData/CFTR_mRNA_sequence.fasta" after clicking on "Choose template file" button
    And user clicks on "Perform specificity check" checkbox
    And user clicks on "Get primers" button
    Then "Primers design" table should become visible