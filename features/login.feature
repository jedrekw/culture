Feature: Login

  Background:

    @javascript
    Scenario: Login
      Given I am on "/user/login"
      When  I fill in "edit-name" with "Behat-redaktor"
      And  I fill in "edit-pass" with "Test1234"
      And I press "edit-submit"
      Then I should not see an "edit-name" element
      And I should not see an "edit-pass" element
      And I should see text matching "Zawartość"
      And I should see text matching "Struktura"
      And I should see text matching "Affiliated content"
      And I should see text matching "Konfiguracja"
      And I should see text matching "Raporty"
      And I should see the link "Pokaż(aktywna karta)"
      And I should see the link "IP addresses"
      And I should see the link "Skróty"
      And I should see the link "Przeglądarka plików"