Feature: Log in
  In order to get access to protected sections of the site
  A user
  Should be able to login

    Scenario: User is not signed up
      Given I do not exist as a user
      When I login with valid credentials
      Then I see an invalid login message
        And I should be loged out

    Scenario: User signs in successfully
      Given I exist as a user
        And I am not logged in
      When I login with valid credentials
      Then I see a successful login message
      When I return to the site
      Then I should be loged in

    Scenario: User enters wrong email
      Given I exist as a user
      And I am not logged in
      When I login with a wrong email
      Then I see an invalid login message
      And I should be loged out
      
    Scenario: User enters wrong password
      Given I exist as a user
      And I am not logged in
      When I login with a wrong password
      Then I see an invalid login message
      And I should be loged out

      