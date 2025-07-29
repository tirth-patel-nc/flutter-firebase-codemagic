Feature: basic_test.feature

  Scenario: basic scenario

    Given the app is initialized
    Then at least one widget should have text {'Flutter Demo Home Page'}
    Then at least one widget should have text {'Sleutel'}

