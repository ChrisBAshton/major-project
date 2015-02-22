Feature: Account Creation
    I should be able to register an account of a certain type, e.g. Law Firm/Agent
    And I should be able to log into said account

  Scenario Outline: Not all fields filled in on registration
    When I fill in the details for a new Organisation account
    # (which could be Law Firm or Mediation Centre)
    And I leave the '<field_label>' field blank
    And I try to register
    Then I should see the message 'Please fill in all fields.'
    
    Examples:
      | field_label       |
      | Email             |
      | Password          |
      | Organisation Name |

  Scenario: Trying to register with an email address that already exists
    When I fill in the details for a new Organisation account
    And I provide an email that is already registered to the system
    And I try to register
    Then I should see the message 'An account is already registered to that email address.'

  @clear
  Scenario: Law Firm registration
    When I fill in the details for a new Organisation account
    And I try to register
    Then the account should be created
    # As discussed in the supervisor meeting, we could add an admin verification stage after account creation.
    # This could be as complicated as we want to make it, so for now, let's add a boolean in the database that
    # says if the Law Firm is verified or not. Make it verified by default, but carry out isVerified checks at login.
    # We can add the verification steps later and make Companies unverified by default.
    # At that stage, we need to add additional scenarios, e.g.
    # Given I am unverified, When I log in, Then I should have restricted access

  Scenario: Account login with valid credentials
    Given I have registered an Organisation account
    When I attempt to log in with valid credentials
    Then I should be logged into the system

  Scenario: Account login with invalid credentials
    Given I have registered an Organisation account
    When I attempt to log in with invalid credentials
    Then an authentication error should be displayed
    # @TODO - as discussed, correct and incorrect login attempts should be logged so that we can later add
    # additional security such as locking out accounts after a threshold of unsuccessful attempts is reached.

  Scenario: Create Agent account
    Given I am logged into a Law Firm account
    Then I should be able to create an Agent account
    And the Individual should be sent an email notifying them they've been registered

  Scenario: Create Mediator account
    Given I am logged into a Mediation Centre account
    Then I should be able to create a Mediator account
    And the Individual should be sent an email notifying them they've been registered

  Scenario: Agent initiates Dispute against a Law Firm not registered to the system
    Given I am a Law Firm
    And I have not yet registered an Organisation account
    And a Dispute has been initiated against my Law Firm
    When I attempt to create a new Organisation account
    Then the account should be created
    And the my Law Firm should be automatically linked to the dispute