CodeBeaker
=======================

see the https://github.com/diophore/book-rspec-codebreaker/blob/master/features/codebreaker_submits_guess.feature

thanks diophore.

special thanks [西脇.rb & 東灘.rb](https://github.com/nishiwaki-higashinadarb)

attendees https://github.com/kyotorb/code_quizzes/network/members

Feature: codebreaker submits guess

  Scenario Outline: submit a guess
  
    Given the secret code is "<code>"
    When I guess "<guess>"
    Then the mark should be "<mark>"

    Scenarios: no matches
      | code | guess | mark |
      | 1234 | 5555  |      |

    Scenarios: 1 number correct
      | code | guess | mark |
      | 1234 | 1555  | +    |
      | 1234 | 2555  | -    |

    Scenarios: 2 numbers correct
      | code | guess | mark |
      | 1234 | 5254  | ++   |
      | 1234 | 5154  | +-   |
      | 1234 | 2545  | --   |

    Scenarios: 3 numbers correct
      | code | guess | mark |
      | 1234 | 5234  | +++  |
      | 1234 | 5134  | ++-  |
      | 1234 | 5124  | +--  |
      | 1234 | 5123  | ---  |

    Scenarios: all numbers correct
      | code | guess | mark |
      | 1234 | 1234  | ++++ |
      | 1234 | 1243  | ++-- |
      | 1234 | 1423  | +--- |
      | 1234 | 4321  | ---- |
    
    Scenarios: matches with duplicates
      | code | guess | mark |
      | 1234 | 1155  | +    |
      | 1234 | 5115  | -    |
      | 1134 | 1155  | ++   |
      | 1134 | 5115  | +-   |
      | 1134 | 5511  | --   |
      | 1134 | 1115  | ++   |
      | 1134 | 5111  | +-   |
      | 1155 | 1234  | +    |
      | 1111 | 1112  | +++  |
      | 1113 | 1121  | ++-  |
      | 3111 | 1311  | ++-- |
      | 3114 | 1251  | --   |
      | 1511 | 2134  | -    |
