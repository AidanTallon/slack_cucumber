@signin
Feature: Signin

  Background:
    Given I am on the sign in page

  Scenario: Signing in with correct details
    When I enter the correct credentials
    Then I should be signed in

  Scenario: Signing in with incorrect details
    When I enter incorrect credentials
    Then I should not be signed in
