Feature: Site Deployment
  In order to publish a site to the internet
  As a user
  I need to be able to deploy sites on Pantheon.

  @vcr site_deploy
  Scenario: Deploy dev to test
    Given I am authenticated
    And a site named "[[test_site_name]]"
    When I run "terminus site deploy --site=[[test_site_name]] --env=test --sync-content --note='Deploy test'"
    Then I should get "."
    And I should get "."
    Then I should get:
    """
    Deploying code to "test", and cloning files from "live", and cloning database from "live"
    """

  @vcr site_deploy_no_changes
  Scenario: Failing to deploy dev to test because there are no changes to deploy
    Given I am authenticated
    And a site named "[[test_site_name]]"
    When I run "terminus site deploy --site=[[test_site_name]] --env=test --sync-content --note='Deploy test'"
    Then I should get: "There is nothing to deploy."
