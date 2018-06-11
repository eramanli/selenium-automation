Feature: Shopping feature

  Scenario: Searching products in GittiGidiyor
    Given I navigate to http://www.gittigidiyor.com
    When I search for televizyon
    Then I go to page 2 and select product 1
    And  I save price of product
    And  I add to chart with no fixpack
    Then I check price of product
    Then I go back
    Then I go back
    Given I search for iphone
    Then I go to page 1 and select product 5
    And  I save price of product
    And  I add to chart with no fixpack
    Then I check price of product
    When I check total price of products in basket
    Then I delete iphone
    And I check total price of products in basket
    And I clear all products in basket
