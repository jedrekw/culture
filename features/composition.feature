Feature: Composition

  Background:

  @javascript
  Scenario: Add composition - check page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    When I am on "/node/add/dzielo"
    Then I should see text matching "Dodaj Dzieło"
    And I should see text matching "Tytuł dzieła"
    And I should see text matching "Język"
    And I should see "Twórca"
    And I should see text matching "Podsumowanie"
    And I should see "Okładka dzieła (kwadratowa)"
    And I should see "Okładka dzieła (prostokątna)"
    And I should see text matching "Kategoria"
    And I should see text matching "A-Z"
    And I should see text matching "Tagi"
    And I should see text matching "Opis dzieła"
    And I should see "Data premiery"
    And I should see text matching "Rodzaj treści"
    And I should see "Opcje dostępu do domeny"
    And I should see text matching "Publikuj w"
    And I should see text matching "Informacja o nowej wersji"

  @javascript
  Scenario: Add composition
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/dzielo"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I scroll Name "field_image[und][0][alt]" into view
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-field-az-und" with random value of length "1"
    And I fill in "edit-field-tag-und" with random value of length "5"
    And I fill in "edit-field-tworca-ref-und-0-target-id" with "Aleksander Fredro (3818068)"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I scroll Name "field_tworca_ref[und][0][target_id]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "16"
    And I click XPATH element "//fieldset/div/div[2]/div/label"
    And I fill in "edit-field-daty-und-0-value-datepicker-popup-0" with todays date
    And I fill in "edit-field-daty-und-0-value2-datepicker-popup-0" with tomorrows date
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see text matching "Auto-publishing this revision."
    And I should see text matching "Wpis"
    And I should see "(Dzieło) został dodany."
    And I should see that page contains random generated text

  @javascript
  Scenario: View composition in content list
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/dzielo"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I scroll Name "field_image[und][0][alt]" into view
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-field-az-und" with random value of length "1"
    And I fill in "edit-field-tag-und" with random value of length "5"
    And I fill in "edit-field-tworca-ref-und-0-target-id" with "Aleksander Fredro (3818068)"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I scroll Name "field_tworca_ref[und][0][target_id]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "16"
    And I click XPATH element "//fieldset/div/div[2]/div/label"
    And I fill in "edit-field-daty-und-0-value-datepicker-popup-0" with todays date
    And I fill in "edit-field-daty-und-0-value2-datepicker-popup-0" with tomorrows date
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Dzieło" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    Then I should see that page contains element with selector "xpath"  with locator "//td[2]/a"  with random generated text
    And I should see "Dzieło" in the "td.views-field.views-field-type" element
    And I should see "Behat-redaktor" in the "a.username" element
    And I should see that page contains element with selector "xpath"  with locator "//td[6]"  with today's date
    And I should see "edytuj" in the "td.views-field.views-field-edit-node > a" element
    And I should see "usuń" in the "td.views-field.views-field-edit-node" element

  @javascript
  Scenario: Edit composition
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/dzielo"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I scroll Name "field_image[und][0][alt]" into view
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-field-az-und" with random value of length "1"
    And I fill in "edit-field-tag-und" with random value of length "5"
    And I fill in "edit-field-tworca-ref-und-0-target-id" with "Aleksander Fredro (3818068)"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I scroll Name "field_tworca_ref[und][0][target_id]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "16"
    And I click XPATH element "//fieldset/div/div[2]/div/label"
    And I fill in "edit-field-daty-und-0-value-datepicker-popup-0" with todays date
    And I fill in "edit-field-daty-und-0-value2-datepicker-popup-0" with tomorrows date
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Dzieło" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-category-und" with "Komiks"
    And I fill in "edit-field-az-und" with random value of length "1"
    And I fill in "edit-field-tag-und" with random value of length "6"
    And I fill in "edit-field-tworca-ref-und-0-target-id" with "Ola Mirecka (7156633)"
    And I scroll Name "field_tworca_ref[und][0][target_id]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "18"
    And I click XPATH element "//fieldset/div/div[2]/div/label"
    And I fill in "edit-field-daty-und-0-value-datepicker-popup-0" with todays date
    And I select "Materiał informacyjny" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see " (Dzieło) został zaktualizowany."
    And I should see that page contains random generated text

  @javascript
  Scenario: Remove composition
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/dzielo"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I scroll Name "field_image[und][0][alt]" into view
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-field-az-und" with random value of length "1"
    And I fill in "edit-field-tag-und" with random value of length "5"
    And I fill in "edit-field-tworca-ref-und-0-target-id" with "Aleksander Fredro (3818068)"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I scroll Name "field_tworca_ref[und][0][target_id]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "16"
    And I click XPATH element "//fieldset/div/div[2]/div/label"
    And I fill in "edit-field-daty-und-0-value-datepicker-popup-0" with todays date
    And I fill in "edit-field-daty-und-0-value2-datepicker-popup-0" with tomorrows date
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Dzieło" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a[2]"
    Then I should see that page contains element with selector "xpath"  with locator "//em"  with random generated text
    And I should see text matching "Czy na pewno usunąć"
    And I should see text matching "Operacja jest nieodwracalna."
    When I press "op"
    Then I should see text matching "Usunięto wpis"
    And I should see that page contains element with selector "xpath"  with locator "//div/em"  with random generated text