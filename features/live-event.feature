Feature: Live-Event

  Background:

  @javascript
  Scenario: Add Live-Event - check page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    When I am on "/node/add/wydarzenie-live"
    Then I should see text matching "Dodaj Wydarzenie live"
    And I should see text matching "Tytuł"
    And I should see text matching "Publikuj w"
    And I should see text matching "Treść"
    And I should see "Okładka wydarzenia (prostokątna)"
    And I should see "Okładka wydarzenia (kwadratowa)"
    And I should see text matching "Kod transmisji live"
    And I should see text matching "Twitter ID"
    And I should see text matching "Instagram hashtag"
    And I should see text matching "Tagi"
    And I should see text matching "Rodzaj treści"
    And I should see text matching "Informacja o nowej wersji"

  @javascript
  Scenario: Add Live-event
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/wydarzenie-live"
    When I fill in "edit-title" with random value to assert of length "8"
    And  I fill in "edit-field-miejsce-und-0-target-id" with "Galeria Krzysztofory (4409203)"
    And I fill in "edit-body-und-0-summary" with random value of length "17"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-kod-transmisji-live-und-0-value" with "https://www.youtube.com/watch?v=wkr-FtZ0YVQ"
    And I fill in "edit-field-instagram-hashtag-und-0-value" with random value of length "6"
    And I fill in "edit-field-tag-und" with " Magdalena Samozwaniec"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-log" with random value of length "10"
    And I scroll ID "edit-revision-operation-2" into view
    And I press "edit-submit"
    Then I should see text matching "Wpis"
    And I should see "(Wydarzenie live) został dodany."
    And I should see that page contains random generated text

  @javascript
  Scenario: View Live-event in content list
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/wydarzenie-live"
    When I fill in "edit-title" with random value to assert of length "8"
    And  I fill in "edit-field-miejsce-und-0-target-id" with "Galeria Krzysztofory (4409203)"
    And I click XPATH element "//label/span/a"
    And I fill in "edit-body-und-0-summary" with random value of length "17"
    And I scroll Name "body[und][0][summary]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
#    And I scroll Name "field_iam_projects[und]" into view
#    And I click XPATH element "//fieldset[2]/div/div[2]/div/div/div/a"
#    And I wait for "5" seconds
#    And I attach the file "C:/pict.png" to the "files[upload]"
#    And I press "edit-upload-upload-button"
#    And I attach the file "C:/pict.png" to the "edit-field-image2-und-0-upload"
#    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
#    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-kod-transmisji-live-und-0-value" with "https://www.youtube.com/watch?v=wkr-FtZ0YVQ"
    And I fill in "edit-field-instagram-hashtag-und-0-value" with random value of length "6"
    And I fill in "edit-field-tag-und" with " Magdalena Samozwaniec"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-log" with random value of length "10"
    And I scroll ID "edit-revision-operation-2" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Wydarzenie live" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    Then I should see that page contains element with selector "xpath"  with locator "//td[2]/a"  with random generated text
    And I should see "Wydarzenie live" in the "td.views-field.views-field-type" element
    And I should see "Behat-redaktor" in the "a.username" element
    And I should see that page contains element with selector "xpath"  with locator "//td[6]"  with today's date
    And I should see "edytuj" in the "td.views-field.views-field-edit-node > a" element
    And I should see "usuń" in the "td.views-field.views-field-edit-node" element

#    ZMIENILI DODAWANIE OBRAZKOW I NIE CHWYTA

  @javascript
  Scenario: Edit Live-event
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/wydarzenie-live"
    When I fill in "edit-title" with random value to assert of length "8"
    And  I fill in "edit-field-miejsce-und-0-target-id" with "Galeria Krzysztofory (4409203)"
    And I click XPATH element "//label/span/a"
    And I fill in "edit-body-und-0-summary" with random value of length "17"
    And I scroll Name "body[und][0][summary]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
#    And I scroll Name "field_iam_projects[und]" into view
#    And I click XPATH element "//fieldset[2]/div/div[2]/div/div/div/a"
#    And I wait for "5" seconds
#    And I attach the file "C:/pict.png" to the "files[upload]"
#    And I press "edit-upload-upload-button"
#    And I attach the file "C:/pict.png" to the "edit-field-image2-und-0-upload"
#    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
#    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-kod-transmisji-live-und-0-value" with "https://www.youtube.com/watch?v=wkr-FtZ0YVQ"
    And I fill in "edit-field-instagram-hashtag-und-0-value" with random value of length "6"
    And I fill in "edit-field-tag-und" with " Magdalena Samozwaniec"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-log" with random value of length "10"
    And I scroll ID "edit-revision-operation-2" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Wydarzenie live" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a"
    When I fill in "edit-title" with random value to assert of length "8"
    And  I fill in "edit-field-miejsce-und-0-target-id" with "Galeria Miejska BWA w Tarnowie (4408899)"
    And I fill in "edit-body-und-0-summary" with random value of length "19"
    And I scroll Name "body[und][0][summary]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "21"
    And I fill in "edit-field-kod-transmisji-live-und-0-value" with "https://www.youtube.com/watch?v=wkr-FtZ0YVQ"
    And I fill in "edit-field-instagram-hashtag-und-0-value" with random value of length "7"
    And I fill in "edit-field-tag-und" with "100 Artists of Tomorrow"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-log" with random value of length "12"
    And I scroll ID "edit-revision-operation-2" into view
    And I press "edit-submit"
    Then I should see " (Wydarzenie live) został zaktualizowany."
    And I should see that page contains random generated text

  @javascript
  Scenario: Remove Live-event
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/wydarzenie-live"
    When I fill in "edit-title" with random value to assert of length "8"
    And  I fill in "edit-field-miejsce-und-0-target-id" with "Galeria Krzysztofory (4409203)"
    And I click XPATH element "//label/span/a"
    And I fill in "edit-body-und-0-summary" with random value of length "17"
    And I scroll Name "body[und][0][summary]" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
#    And I scroll Name "field_iam_projects[und]" into view
#    And I click XPATH element "//fieldset[2]/div/div[2]/div/div/div/a"
#    And I wait for "5" seconds
#    And I attach the file "C:/pict.png" to the "files[upload]"
#    And I press "edit-upload-upload-button"
#    And I attach the file "C:/pict.png" to the "edit-field-image2-und-0-upload"
#    And I scroll ID "edit-field-image2-und-0-upload-upload-source" into view
#    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-kod-transmisji-live-und-0-value" with "https://www.youtube.com/watch?v=wkr-FtZ0YVQ"
    And I fill in "edit-field-instagram-hashtag-und-0-value" with random value of length "6"
    And I fill in "edit-field-tag-und" with " Magdalena Samozwaniec"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-log" with random value of length "10"
    And I scroll ID "edit-revision-operation-2" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Wydarzenie live" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a[2]"
    Then I should see that page contains element with selector "xpath"  with locator "//em"  with random generated text
    And I should see text matching "Czy na pewno usunąć"
    And I should see text matching "Operacja jest nieodwracalna."
    When I press "op"
    Then I should see text matching "Usunięto wpis"