Feature: Site

  Background:

  @javascript
  Scenario: Add site - check page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    When I am on "/node/add/miejsce"
    Then I should see text matching "Dodaj Miejsce"
    And I should see text matching "Nazwa miejsca"
    And I should see text matching "Język"
    And I should see text matching "Opis miejsca"
    And I should see text matching "YOUKU"
    And I should see text matching "Tagi"
    And I should see text matching "Kategoria"
    And I should see text matching "LOCATION"
    And I should see text matching "Ulica"
    And I should see text matching "Miasto"
    And I should see text matching "Stan/Prowincja"
    And I should see text matching "Kod pocztowy"
    And I should see text matching "Państwo"
    And I should see text matching "Szerokość geograficzna"
    And I should see text matching "Długość geograficzna"
    And I should see text matching "BAIDU"
    And I should see text matching "Informacja o nowej wersji"
    And I should see "Zdjęcie miejsca (kwadratowe)"
    And I should see "Zdjęcie miejsca (prostokątne)"
    And I should see text matching "Photo"
    And I should see text matching "Rodzaj miejsca"
    And I should see text matching "Publikuj w"
    And I should see text matching "Rodzaj treści"

  @javascript
  Scenario: Add site
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/miejsce"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
    And I press "field_image2_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-photo-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-alt" into view
    And I press "field_photo_und_0_upload_button"
    And I scroll ID "edit-field-polecane-und" into view
    And I click random XPATH element "//div[2]/div/div/div[%s]/input" with range from "1" to "12"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-field-tag-und" with "100 voices a journey home"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-locations-0-street" with "Kunickiego"
    And I fill in "edit-locations-0-city" with "Wrocław"
    And I select "Lodzkie" from "edit-locations-0-province"
    And I fill in "edit-locations-0-postal-code" with "54-616"
    And I press "find-location-button"
    When I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see text matching "Auto-publishing this revision."
    And I should see text matching "Wpis"
    And I should see " (Miejsce) został dodany."
    And I should see that page contains random generated text

  @javascript
  Scenario: View site in content list
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/miejsce"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
#    And I attach the file "C:/pict.png" to the "edit-field-image-und-0-upload"
#    And I press "field_image_und_0_upload_button"
#    And I attach the file "C:/pict.png" to the "edit-field-image2-und-0-upload"
#    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
#    And I press "field_image2_und_0_upload_button"
#    And I attach the file "C:/pict.png" to the "edit-field-photo-und-0-upload"
#    And I scroll ID "edit-field-image2-und-0-alt" into view
#    And I press "field_photo_und_0_upload_button"
    And I scroll ID "edit-field-polecane-und" into view
    And I click random XPATH element "//div[2]/div/div/div[%s]/input" with range from "1" to "12"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I scroll ID "edit-language" into view
    And I click XPATH element "//span/a"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-field-tag-und" with "100 voices a journey home"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-locations-0-street" with "Kunickiego"
    And I fill in "edit-locations-0-city" with "Wrocław"
    And I select "Lodzkie" from "edit-locations-0-province"
    And I fill in "edit-locations-0-postal-code" with "54-616"
    And I press "find-location-button"
    When I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Miejsce" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    Then I should see that page contains element with selector "xpath"  with locator "//td[2]/a"  with random generated text
    And I should see "Miejsce" in the "td.views-field.views-field-type" element
    And I should see "Behat-redaktor" in the "a.username" element
    And I should see that page contains element with selector "xpath"  with locator "//td[6]"  with today's date
    And I should see "edytuj" in the "td.views-field.views-field-edit-node > a" element
    And I should see "usuń" in the "td.views-field.views-field-edit-node" element

#    ZMIENILI DODAWANIE OBRAZKOW

  @javascript
  Scenario: Edit site
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/miejsce"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
#    And I attach the file "C:/pict.png" to the "edit-field-image-und-0-upload"
#    And I press "field_image_und_0_upload_button"
#    And I attach the file "C:/pict.png" to the "edit-field-image2-und-0-upload"
#    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
#    And I press "field_image2_und_0_upload_button"
#    And I attach the file "C:/pict.png" to the "edit-field-photo-und-0-upload"
#    And I scroll ID "edit-field-image2-und-0-alt" into view
#    And I press "field_photo_und_0_upload_button"
    And I scroll ID "edit-field-polecane-und" into view
    And I click random XPATH element "//div[2]/div/div/div[%s]/input" with range from "1" to "12"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I scroll ID "edit-language" into view
    And I click XPATH element "//span/a"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-field-tag-und" with "100 voices a journey home"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-locations-0-street" with "Kunickiego"
    And I fill in "edit-locations-0-city" with "Wrocław"
    And I select "Lodzkie" from "edit-locations-0-province"
    And I fill in "edit-locations-0-postal-code" with "54-616"
    And I press "find-location-button"
    When I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Miejsce" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a"
    When I fill in "edit-title" with random value to assert of length "9"
    And I select "PL" from "edit-language"
    And I scroll ID "edit-field-polecane-und" into view
#    And I click random XPATH element "//div[2]/div/div/div[%s]/input" with range from "1" to "12"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I scroll ID "edit-language" into view
#    And I click XPATH element "//span/a"
    And I fill in "edit-body-und-0-summary" with random value of length "16"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "22"
    And I fill in "edit-field-tag-und" with "#jakwpolskimfilmie"
    And I fill in "edit-field-category-und" with "Fotografia"
    And I fill in "edit-locations-0-street" with "Kunickiego"
    And I fill in "edit-locations-0-city" with "Wrocław"
    And I select "Dolnoslaskie" from "edit-locations-0-province"
    And I fill in "edit-locations-0-postal-code" with "54-617"
    And I press "find-location-button"
    When I fill in "edit-log" with random value of length "11"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see " (Miejsce) został zaktualizowany."
    And I should see that page contains random generated text

  @javascript
  Scenario: Remove site
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/miejsce"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
#    And I attach the file "C:/pict.png" to the "edit-field-image-und-0-upload"
#    And I press "field_image_und_0_upload_button"
#    And I attach the file "C:/pict.png" to the "edit-field-image2-und-0-upload"
#    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
#    And I press "field_image2_und_0_upload_button"
#    And I attach the file "C:/pict.png" to the "edit-field-photo-und-0-upload"
#    And I scroll ID "edit-field-image2-und-0-alt" into view
#    And I press "field_photo_und_0_upload_button"
    And I scroll ID "edit-field-polecane-und" into view
    And I click random XPATH element "//div[2]/div/div/div[%s]/input" with range from "1" to "12"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I scroll ID "edit-language" into view
    And I click XPATH element "//span/a"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-field-tag-und" with "100 voices a journey home"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-locations-0-street" with "Kunickiego"
    And I fill in "edit-locations-0-city" with "Wrocław"
    And I select "Lodzkie" from "edit-locations-0-province"
    And I fill in "edit-locations-0-postal-code" with "54-616"
    And I press "find-location-button"
    When I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Miejsce" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a[2]"
    Then I should see that page contains element with selector "xpath"  with locator "//em"  with random generated text
    And I should see text matching "Czy na pewno usunąć"
    And I should see text matching "Operacja jest nieodwracalna."
    When I press "op"
    Then I should see text matching "Usunięto wpis"
    And I should see that page contains element with selector "xpath"  with locator "//div/em"  with random generated text