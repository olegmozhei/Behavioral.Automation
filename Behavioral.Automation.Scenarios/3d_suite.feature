Feature: 3d_suite. Negative
User opened main page
User provides DNA template
User specified settings for findings primers in given template
Provided input (sequence or settings) is invalid
and user starts design and users get an error.

@Reference:PrimerDesign-1
@Reference:PrimerDesign-2
    
Scenario: User leaves template empty and get an error. 
    Given application URL is opened
    When user clicks on "Get primers" button
    Then label "Error" should have "Exception error: No sequence input was provided ." text
    
Scenario Outline: User get an ERROR providing invalid data in template. 
    Given application URL is opened
    When user enters "<invalid input>" into "Template" input
    And user clicks on "Perform specificity check" checkbox 
    And user clicks on "Get primers" button
    Then label "Error" should become visible
    Examples: 
    | invalid input                             |
    | AF0719899999999999999999999999999999998.1 | 
    | ~!@#$%^&*()_+":}{[]                       |
    | 8950859465900                             |
   
Scenario: User input invalid sequence of DNA. 
    Given application URL is opened
    When user enters "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGCCCCCCCCCCCCCCCCCAAAAAAAAAAAAAATTTTTTTTTTTTTTTTTT" into "Template" input
    And user clicks on "Get primers" button
    Then label "Error" should become visible

    
Scenario Outline: User provides DNA and provides invalid range settings and get an error  
    Given application URL is opened
    When user enters "GGATGAGTGTCAGCCAGTGTAACCCGATGAGCTACCCAGTAGTCGAACTGGGCCAGACAACCCGGCGCTAATGCACTCAATCCCGAGGCCTGACGCGACATATCAGCTAAGAGTAGGCCGGGGGTGTAGACCTTTGGGGTTGAATAAATCTATTGTACTAATCGGCTTCAACGTGCCGCACGGGTGGCACCTCAGGAGGGGCCCACAGGGAGGAAGTAAACTGCTATTCGTCGCCGATGGTGGTAACTAATTATGTTCCTTGCCACTACAATTGTATCTAAGCCGTGTAATGAGAACATC" into "Template" input
    And user clicks on "Perform specificity check" checkbox 
    And user enters "<fpf>" into "Forward primer from" input
    And user enters "<fpt>" into "Forward primer to" input
    And user enters "<rpf>" into "Reverse primer from" input
    And user enters "<rpt>" into "Reverse primer to" input
    And user clicks on "Get primers" button
    Then label "Error" should become visible
    Examples:
      | fpf | fpt | rpf | rpt |
      | 0   | 100 | 200 | 300 |
      | 2   | 50  | 49  | 100 |