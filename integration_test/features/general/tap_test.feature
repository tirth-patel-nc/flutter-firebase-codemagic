Feature: tap_test.feature

  Scenario: tap stuff

    Given the app is initialized
    Then at least one widget should have text {'0'}

    When tap floating action button by tooltip {'Increment'}
    Then at least one widget should have text {'1'}

    When tap floating action button by tooltip {'Increment'}
    Then at least one widget should have text {'2'}

    When tap floating action button by tooltip {'Increment'}
    When tap floating action button by tooltip {'Increment'}
    When tap floating action button by tooltip {'Increment'}
    Then at least one widget should have text {'5'}

