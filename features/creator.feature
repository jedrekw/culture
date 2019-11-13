Feature: Creator

  Background:

  @javascript
  Scenario: Add creator - check page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    When I am on "/node/add/tworca"
    Then I should see text matching "Dodaj Twórca"
    And I should see text matching "Imię i nazwisko twórcy"
    And I should see text matching "Język"
    And I should see text matching "Krótki opis twórcy"
    And I should see "Zdjęcie twórcy (kwadratowe)"
    And I should see "Zdjęcie twórcy (prostokątne)"
    And I should see "Lata życia"
    And I should see text matching "Podsumowanie"
    And I should see text matching "Opis twórcy"
    And I should see text matching "Top photo"
    And I should see text matching "Related artists"
    And I should see "Youku"
    And I should see text matching "Publikuj w"
    And I should see text matching "Informacja o nowej wersji"

  @javascript
  Scenario: Add creator
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/tworca"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-opis-und-0-value" with random value of length "10"
    And I fill in "edit-body-und-0-summary" with random value of length "20"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-birth-death-und-0-value-date" with todays date
    And I fill in "edit-field-category-und" with "Design"
    And I fill in "edit-field-tag-und" with " Magdalena Samozwaniec"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-field-az-und" with "A"
    And I fill in "edit-field-kolejno-sortowania-und-0-value" with random value of length "7"
    And I scroll ID "edit-field-opis-und-0-value" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "30"
    And I scroll ID "edit-domains-7" into view
    And I click XPATH element "//div[5]/div/label"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-top-photo-und-0-upload"
    And I press "field_top_photo_und_0_upload_button"
    And I fill in "edit-field-related-artists-block-und" with "Dominika Janicka (7173360)"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see text matching "Auto-publishing this revision."
    And I should see text matching "Wpis"
    And I should see "(Twórca) został dodany."
    And I should see that page contains random generated text

  @javascript
  Scenario: View creator in content list
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/tworca"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-opis-und-0-value" with random value of length "10"
    And I fill in "edit-body-und-0-summary" with random value of length "20"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-birth-death-und-0-value-date" with todays date
    And I fill in "edit-field-category-und" with "Design"
    And I fill in "edit-field-tag-und" with " Magdalena Samozwaniec"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-field-az-und" with "A"
    And I fill in "edit-field-kolejno-sortowania-und-0-value" with random value of length "7"
    And I scroll ID "edit-field-opis-und-0-value" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "30"
    And I scroll ID "edit-domains-7" into view
    And I click XPATH element "//div[5]/div/label"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-top-photo-und-0-upload"
    And I press "field_top_photo_und_0_upload_button"
    And I fill in "edit-field-related-artists-block-und" with "Dominika Janicka (7173360)"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Twórca" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    Then I should see that page contains element with selector "xpath"  with locator "//td[2]/a"  with random generated text
    And I should see "Twórca" in the "td.views-field.views-field-type" element
    And I should see "Behat-redaktor" in the "a.username" element
    And I should see that page contains element with selector "xpath"  with locator "//td[6]"  with today's date
    And I should see "edytuj" in the "td.views-field.views-field-edit-node > a" element
    And I should see "usuń" in the "td.views-field.views-field-edit-node" element

  @javascript
  Scenario: Edit creator
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/tworca"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-opis-und-0-value" with random value of length "10"
    And I fill in "edit-body-und-0-summary" with random value of length "20"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-birth-death-und-0-value-date" with todays date
    And I fill in "edit-field-category-und" with "Design"
    And I fill in "edit-field-tag-und" with " Magdalena Samozwaniec"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-field-az-und" with "A"
    And I fill in "edit-field-kolejno-sortowania-und-0-value" with random value of length "7"
    And I scroll ID "edit-field-opis-und-0-value" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "30"
    And I scroll ID "edit-domains-7" into view
    And I click XPATH element "//div[5]/div/label"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-top-photo-und-0-upload"
    And I press "field_top_photo_und_0_upload_button"
    And I fill in "edit-field-related-artists-block-und" with "Dominika Janicka (7173360)"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Twórca" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a"
    When I fill in "edit-title" with random value to assert of length "7"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-opis-und-0-value" with random value of length "10"
    And I fill in "edit-field-birth-death-und-0-value-date" with todays date
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-field-tag-und" with "aaron copland"
    And I select "Materiał informacyjny" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-field-az-und" with "B"
    And I fill in "edit-field-kolejno-sortowania-und-0-value" with random value of length "6"
    And I scroll ID "edit-field-opis-und-0-value" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "32"
    And I scroll ID "edit-domains-7" into view
    And I click XPATH element "//div[5]/div/label"
    And I fill in "edit-field-related-artists-block-und" with "Gal Anonim (7173697)"
    And I fill in "edit-log" with random value of length "12"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see " (Twórca) został zaktualizowany."
    And I should see that page contains random generated text

  @javascript
  Scenario: Remove creator
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/tworca"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-opis-und-0-value" with random value of length "10"
    And I fill in "edit-body-und-0-summary" with random value of length "20"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-birth-death-und-0-value-date" with todays date
    And I fill in "edit-field-category-und" with "Design"
    And I fill in "edit-field-tag-und" with " Magdalena Samozwaniec"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-field-az-und" with "A"
    And I fill in "edit-field-kolejno-sortowania-und-0-value" with random value of length "7"
    And I scroll ID "edit-field-opis-und-0-value" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "30"
    And I scroll ID "edit-domains-7" into view
    And I click XPATH element "//div[5]/div/label"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-top-photo-und-0-upload"
    And I press "field_top_photo_und_0_upload_button"
    And I fill in "edit-field-related-artists-block-und" with "Dominika Janicka (7173360)"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Twórca" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a[2]"
    Then I should see that page contains element with selector "xpath"  with locator "//em"  with random generated text
    And I should see text matching "Czy na pewno usunąć"
    And I should see text matching "Operacja jest nieodwracalna."
    When I press "op"
    Then I should see text matching "Usunięto wpis"
    And I should see that page contains element with selector "xpath"  with locator "//div/em"  with random generated text