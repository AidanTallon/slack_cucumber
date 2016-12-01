Feature: Status Indicator

  Background:
    Given I am logged in
    And I am on the channels page

  @status @wip
  Scenario: I am active
    Given I have set my status to active
    Then my status should be active

  @status @wip
  Scenario: I am away
    Given I have set my status to away
    Then my status should be away

  @status @wip
  Scenario: I am active and don't want to be disturbed
    Given I have set my status to active
    And I have set not to be disturbed
    Then my status should be sleeping
    And my status should be active

  @status @wip
  Scenario: I am away and don't want to be disturbed
    Given I have set my status to away
    And I have set not to be disturbed
    Then my status should be sleeping
    And my status should be away
