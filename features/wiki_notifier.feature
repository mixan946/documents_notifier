Feature: Wiki notifier
  In order not to spam user
  As an user
  I want to send emails to only checked users

  Scenario: With "Notify project members?" unchecked
    Given I changed wiki content
    And "Notify project members?" unchecked
    When I press save button
    Then Nobody receives email except watchers

  Scenario: With "Notify project members?" checked with no one checked
    Given I changed wiki content
    When I check "Notify project members?"
    Then I get list of project's users
    When I press save button
    Then Nobody receives email except watchers

  Scenario: With "Notify project members?" checked with some users checked
    Given I changed wiki content
    When I check "Notify project members?"
    Then I get list of project's users
    Given I check some random users
    When I press save button
    Then random users and watchers will get email
