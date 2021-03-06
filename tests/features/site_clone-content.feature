Feature: Cloning site content
  In order to duplicate a site
  As a user
  I need to be able to duplicate a site.

  @vcr site_clone-content
  Scenario: Site Clone Environment
    Given I am authenticated
    And a site named "[[test_site_name]]"
    When I run "terminus site clone-content --site=[[test_site_name]] --from-env=test --to-env=dev --yes"
    Then I should get:
    """
    Cloning database
    """
    Then I should get "."
    Then I should get:
    """
    Cloning files
    """
    Then I should get "."
    Then I should get:
    """
    Cloning files from "test" to "dev"
    """
