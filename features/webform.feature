Feature: Webform

  Background:

  @javascript
  Scenario: Add webform
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/webform"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "18"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see text matching "Auto-publishing this revision."
    And I should see text matching "Wpis"
    And I should see "(Formularz) został dodany."
    And I should see that page contains random generated text
    And I should see text matching "Nowy formularz"
    And I should see text matching "został stworzony. Dodaj nowe pola do formularza poniżej."
    When I fill in "edit-add-name" with random value to assert of length "8"
    And I press "edit-add-add"
    Then I should see "Edycja komponentu:"
    And I should see that page contains random generated text
    When I fill in "edit-value" with "[apply-for-role:applied]"
    And I fill in "edit-extra-description" with random value of length "20"
    And I fill in "edit-extra-maxlength" with "50"
    And I press "edit-actions-submit"
    Then I should see text matching "Dodano nowy komponent"
    And I should see text matching "Pole tekstowe"
    And I should see "[apply-for-role:applied]"
    And I should see that page contains random generated text
    And I should see "Edytuj"
    And I should see "Klonuj"
    And I should see "Usuń"