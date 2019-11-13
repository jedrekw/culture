Feature: Gallery

  Background:

  @javascript
  Scenario: Add gallery - check page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    When I am on "/node/add/galeria"
    Then I should see text matching "Dodaj Galeria"
    And I should see text matching "Tytuł galerii"
    And I should see text matching "Podtytuł"
    And I should see text matching "Język"
    And I should see text matching "Opis galerii"
    And I should see text matching "Autor zdjęć"
    And I should see text matching "Rodzaj treści"
    And I should see text matching "Tagi"
    And I should see text matching "Kategoria"
    And I should see text matching "Publikuj w"
    And I should see text matching "Informacja o nowej wersji"
    And I should see text matching "LISTA ZDJĘĆ"
    And I should see text matching "Dodaj nowy plik"
    And I should see text matching "Polecane na multimediach"
    And I should see text matching "Sekcja Specjalna"

  @javascript
  Scenario: Add gallery
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/galeria"
    When I fill in "edit-title" with random value to assert of length "8"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-picture-und-0-upload"
    And I press "field_picture_und_0_upload_button"
    And I fill in "edit-field-subtitle-und-0-value" with random value of length "14"
    And I select "PL" from "edit-language"
    And I click XPATH element "//span/a"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I scroll Name "body[und][0][summary]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "16"
    And I fill in "edit-field-autor-und-0-value" with random value of length "10"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-field-tag-und" with random value of length "7"
    And I fill in "edit-field-kategoria-und" with "Multimedia"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see text matching "Auto-publishing this revision."
    And I should see text matching "Wpis"
    And I should see "(Galeria) został dodany."
    And I should see that page contains random generated text

  @javascript
  Scenario: View gallery in content list
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/galeria"
    When I fill in "edit-title" with random value to assert of length "8"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-picture-und-0-upload"
    And I press "field_picture_und_0_upload_button"
    And I fill in "edit-field-subtitle-und-0-value" with random value of length "14"
    And I select "PL" from "edit-language"
    And I click XPATH element "//span/a"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I scroll Name "body[und][0][summary]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "16"
    And I fill in "edit-field-autor-und-0-value" with random value of length "10"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-field-tag-und" with random value of length "7"
    And I fill in "edit-field-kategoria-und" with "Multimedia"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Galeria" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    Then I should see that page contains element with selector "xpath"  with locator "//td[2]/a"  with random generated text
    And I should see "Galeria" in the "td.views-field.views-field-type" element
    And I should see "Behat-redaktor" in the "a.username" element
    And I should see that page contains element with selector "xpath"  with locator "//td[6]"  with today's date
    And I should see "edytuj" in the "td.views-field.views-field-edit-node > a" element
    And I should see "usuń" in the "td.views-field.views-field-edit-node" element

  @javascript
  Scenario: Edit gallery
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/galeria"
    When I fill in "edit-title" with random value to assert of length "8"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-picture-und-0-upload"
    And I press "field_picture_und_0_upload_button"
    And I fill in "edit-field-subtitle-und-0-value" with random value of length "14"
    And I select "PL" from "edit-language"
    And I click XPATH element "//span/a"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I scroll Name "body[und][0][summary]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "16"
    And I fill in "edit-field-autor-und-0-value" with random value of length "10"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-field-tag-und" with random value of length "7"
    And I fill in "edit-field-kategoria-und" with "Multimedia"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Galeria" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a"
    When I fill in "edit-title" with random value to assert of length "9"
    And I fill in "edit-field-subtitle-und-0-value" with random value of length "15"
    And I select "PL" from "edit-language"
    And I fill in "edit-body-und-0-summary" with random value of length "16"
    And I scroll Name "body[und][0][summary]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "18"
    And I fill in "edit-field-autor-und-0-value" with random value of length "11"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-field-tag-und" with random value of length "8"
    And I fill in "edit-field-kategoria-und" with "Multimedia"
    And I fill in "edit-log" with random value of length "11"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see " (Galeria) został zaktualizowany."
    And I should see that page contains random generated text

  @javascript
  Scenario: Remove gallery
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/galeria"
    When I fill in "edit-title" with random value to assert of length "8"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-picture-und-0-upload"
    And I press "field_picture_und_0_upload_button"
    And I fill in "edit-field-subtitle-und-0-value" with random value of length "14"
    And I select "PL" from "edit-language"
    And I click XPATH element "//span/a"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I scroll Name "body[und][0][summary]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "16"
    And I fill in "edit-field-autor-und-0-value" with random value of length "10"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-field-tag-und" with random value of length "7"
    And I fill in "edit-field-kategoria-und" with "Multimedia"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Galeria" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a[2]"
    Then I should see that page contains element with selector "xpath"  with locator "//em"  with random generated text
    And I should see text matching "Czy na pewno usunąć"
    And I should see text matching "Operacja jest nieodwracalna."
    When I press "op"
    Then I should see text matching "Usunięto wpis"
    And I should see that page contains element with selector "xpath"  with locator "//div/em"  with random generated text