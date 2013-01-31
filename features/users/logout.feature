Feature: Log out
  To protect my account from unauthorized access
  A signed in user
  Should be able to logout

    Scenario: User signs out
      Given I am logged in
      When I logout
      Then I should see a signed out message
      When I return to the site
      Then I should be loged out
