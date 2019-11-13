Feature: Event

  Background:

  @javascript
  Scenario: Add event - check page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    When I am on "/node/add/wydarzenie"
    Then I should see text matching "Dodaj Wydarzenie"
    And I should see text matching "Tytuł wydarzenia"
    And I should see text matching "Język"
    And I should see "Miejsce"
    And I should see "Data wydarzenia"
    And I should see text matching "Podsumowanie"
    And I should see text matching "Opis wydarzenia"
    And I should see "Youku"
    And I should see "Powiązane elementy"
    And I should see "Baidu"
    And I should see text matching "Publikuj w"
    And I should see "Okładka wydarzenia (prostokątna)"
    And I should see "Okładka wydarzenia (kwadratowa)"
    And I should see text matching "Photo"
    And I should see text matching "Galeria"
    And I should see text matching "Miasta"
    And I should see text matching "Kup bilet"
    And I should see text matching "Kategoria"
    And I should see text matching "Tagi"
    And I should see text matching "Rodzaj treści"
    And I should see text matching "Państwa Azja"
    And I should see text matching "Informacja o nowej wersji"

  @javascript
  Scenario: Add event
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/wydarzenie"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-miejsce-und-0-target-id" with "Baszta Czarownic (4409051)"
    And I fill in "edit-field-daty-und-0-value-datepicker-popup-0" with todays date
    And I fill in "edit-field-daty-und-0-value2-datepicker-popup-0" with tomorrows date
    And I attach the file "C/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
    And I press "field_image2_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict1.png" to the "edit-field-photo-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-alt" into view
    And I press "field_photo_und_0_upload_button"
    And I fill in "edit-field-galeria-ref-und-0-target-id" with "Alla polacca (1649381)"
    And I fill in "edit-field-miasta-und" with "Taipei"
    And I fill in "edit-field-category-und" with "Design"
    And I fill in "edit-field-tag-und" with " Magdalena Samozwaniec"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-field-powiazany-element-und-0-target-id" with "A JEDNAK LITERATURA (5834223)"
    And I fill in "edit-field-baidu-und-0-name" with random value of length "10"
    And I fill in "edit-field-baidu-und-0-street" with "Kunickiego, Wrocław"
    And I fill in "edit-log" with random value of length "10"
    And I scroll ID "edit-revision-operation-2" into view
    And I press "edit-submit"
    Then I should see text matching "Auto-publishing this revision."
    And I should see text matching "Wpis"
    And I should see "(Wydarzenie) został dodany."
    And I should see that page contains random generated text

  @javascript
  Scenario: View event in content list
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/wydarzenie"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-miejsce-und-0-target-id" with "Baszta Czarownic (4409051)"
    And I fill in "edit-field-daty-und-0-value-datepicker-popup-0" with todays date
    And I fill in "edit-field-daty-und-0-value2-datepicker-popup-0" with tomorrows date
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
    And I press "field_image2_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict1.png" to the "edit-field-photo-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-alt" into view
    And I press "field_photo_und_0_upload_button"
    And I fill in "edit-field-galeria-ref-und-0-target-id" with "Alla polacca (1649381)"
    And I fill in "edit-field-miasta-und" with "Taipei"
    And I fill in "edit-field-category-und" with "Design"
    And I fill in "edit-field-tag-und" with " Magdalena Samozwaniec"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-field-powiazany-element-und-0-target-id" with "A JEDNAK LITERATURA (5834223)"
    And I fill in "edit-field-baidu-und-0-name" with random value of length "10"
    And I fill in "edit-field-baidu-und-0-street" with "Kunickiego, Wrocław"
    And I fill in "edit-log" with random value of length "10"
    And I scroll ID "edit-revision-operation-2" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Wydarzenie" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    Then I should see that page contains element with selector "xpath"  with locator "//td[2]/a"  with random generated text
    And I should see "Wydarzenie" in the "td.views-field.views-field-type" element
    And I should see "Behat-redaktor" in the "a.username" element
    And I should see that page contains element with selector "xpath"  with locator "//td[6]"  with today's date
    And I should see "edytuj" in the "td.views-field.views-field-edit-node > a" element
    And I should see "usuń" in the "td.views-field.views-field-edit-node" element

  @javascript
  Scenario: Edit event
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/wydarzenie"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-miejsce-und-0-target-id" with "Baszta Czarownic (4409051)"
    And I fill in "edit-field-daty-und-0-value-datepicker-popup-0" with todays date
    And I fill in "edit-field-daty-und-0-value2-datepicker-popup-0" with tomorrows date
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
    And I press "field_image2_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict1.png" to the "edit-field-photo-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-alt" into view
    And I press "field_photo_und_0_upload_button"
    And I fill in "edit-field-galeria-ref-und-0-target-id" with "Alla polacca (1649381)"
    And I fill in "edit-field-miasta-und" with "Taipei"
    And I fill in "edit-field-category-und" with "Design"
    And I fill in "edit-field-tag-und" with " Magdalena Samozwaniec"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-field-powiazany-element-und-0-target-id" with "A JEDNAK LITERATURA (5834223)"
    And I fill in "edit-field-baidu-und-0-name" with random value of length "10"
    And I fill in "edit-field-baidu-und-0-street" with "Kunickiego, Wrocław"
    And I fill in "edit-log" with random value of length "10"
    And I scroll ID "edit-revision-operation-2" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Wydarzenie" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a"
    When I fill in "edit-title" with random value to assert of length "9"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-miejsce-und-0-target-id" with "Galeria Miejska BWA w Tarnowie (4408899)"
    And I fill in "edit-field-daty-und-0-value-datepicker-popup-0" with todays date
    And I fill in "edit-field-daty-und-0-value2-datepicker-popup-0" with tomorrows date
    And I fill in "edit-field-galeria-ref-und-0-target-id" with "Alla polacca (1649381)"
    And I fill in "edit-field-miasta-und" with "Walencja"
    And I fill in "edit-field-category-und" with "Muzyka"
    And I fill in "edit-field-tag-und" with "a roman fun and ferd ganev"
    And I select "Materiał informacyjny" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-field-powiazany-element-und-0-target-id" with "Bach 200 UW - otwarcie cyklu (6121063)"
    And I fill in "edit-field-baidu-und-0-name" with random value of length "12"
    And I fill in "edit-field-baidu-und-0-street" with "Gagarina, Wrocław"
    And I fill in "edit-log" with random value of length "12"
    And I scroll ID "edit-revision-operation-2" into view
    And I press "edit-submit"
    Then I should see " (Wydarzenie) został zaktualizowany."
    And I should see that page contains random generated text

  @javascript
  Scenario: Remove event
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/wydarzenie"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-miejsce-und-0-target-id" with "Baszta Czarownic (4409051)"
    And I fill in "edit-field-daty-und-0-value-datepicker-popup-0" with todays date
    And I fill in "edit-field-daty-und-0-value2-datepicker-popup-0" with tomorrows date
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
    And I press "field_image2_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict1.png" to the "edit-field-photo-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-alt" into view
    And I press "field_photo_und_0_upload_button"
    And I fill in "edit-field-galeria-ref-und-0-target-id" with "Alla polacca (1649381)"
    And I fill in "edit-field-miasta-und" with "Taipei"
    And I fill in "edit-field-category-und" with "Design"
    And I fill in "edit-field-tag-und" with " Magdalena Samozwaniec"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-field-powiazany-element-und-0-target-id" with "A JEDNAK LITERATURA (5834223)"
    And I fill in "edit-field-baidu-und-0-name" with random value of length "10"
    And I fill in "edit-field-baidu-und-0-street" with "Kunickiego, Wrocław"
    And I fill in "edit-log" with random value of length "10"
    And I scroll ID "edit-revision-operation-2" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Wydarzenie" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a[2]"
    Then I should see that page contains element with selector "xpath"  with locator "//em"  with random generated text
    And I should see text matching "Czy na pewno usunąć"
    And I should see text matching "Operacja jest nieodwracalna."
    When I press "op"
    Then I should see text matching "Usunięto wpis"
    And I should see that page contains element with selector "xpath"  with locator "//div/em"  with random generated text