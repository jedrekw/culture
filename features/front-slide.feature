Feature: Front-Slide

  Background:

  @javascript
  Scenario: Add front-slide - check page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    When I am on "/node/add/front-slide"
    Then I should see text matching "Dodaj FrontSlide"
    And I should see text matching "Powiązany artykuł"
    And I should see text matching "Tytuł slajdu"
    And I should see text matching "Obraz"
    And I should see text matching "Język"
    And I should see text matching "Kategoria"
    And I should see text matching "Where should be shown"
    And I should see text matching "Azja Kategorie"
    And I should see text matching "Tagi"
    And I should see text matching "Publikuj w"
    And I should see text matching "Kolor tła"
    And I should see text matching "URL"
    And I should see text matching "Opis slajdu"
    And I should see text matching "Informacja o nowej wersji"

  @javascript
  Scenario: Add front-slide
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/front-slide"
    When I fill in "edit-title" with random value to assert of length "8"
    And I attach the file "/data/staging/culture/pict1.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I click random XPATH element "//div[3]/div/div/div/div[%d]/input" with range from "1" to "6"
    And I click random XPATH element "//div[%s]/input" with range from "7" to "14"
    And I fill in "edit-field-tag-und" with random value of length "7"
    And I select "PL" from "edit-language"
    And I scroll Name "language" into view
    And I click XPATH element "//div[5]/div/div/div[2]/label"
    And I click random XPATH element "//div[6]/div/div/div[%s]/label" with range from "1" to "6"
    And I fill in "edit-field-url-und-0-url" with "www.onet.pl"
    And I fill in "edit-body-und-0-value" with random value of length "15"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see text matching "Wpis"
    And I should see "(FrontSlide) został dodany."
    And I should see that page contains random generated text

  @javascript
  Scenario: View front-slide in content list
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/front-slide"
    When I fill in "edit-title" with random value to assert of length "8"
    And I attach the file "/data/staging/culture/pict1.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I click random XPATH element "//div[3]/div/div/div/div[%d]/input" with range from "1" to "6"
    And I click random XPATH element "//div[%s]/input" with range from "7" to "14"
    And I fill in "edit-field-tag-und" with random value of length "7"
    And I select "PL" from "edit-language"
    And I scroll Name "language" into view
    And I click XPATH element "//div[5]/div/div/div[2]/label"
    And I click random XPATH element "//div[6]/div/div/div[%s]/label" with range from "1" to "6"
    And I fill in "edit-field-url-und-0-url" with "www.onet.pl"
    And I fill in "edit-body-und-0-value" with random value of length "15"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "FrontSlide" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    Then I should see that page contains element with selector "xpath"  with locator "//td[2]/a"  with random generated text
    And I should see "FrontSlide" in the "td.views-field.views-field-type" element
    And I should see "Behat-redaktor" in the "a.username" element
    And I should see that page contains element with selector "xpath"  with locator "//td[6]"  with today's date
    And I should see "edytuj" in the "td.views-field.views-field-edit-node > a" element
    And I should see "usuń" in the "td.views-field.views-field-edit-node" element

  @javascript
  Scenario: Edit front-slide
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/front-slide"
    When I fill in "edit-title" with random value to assert of length "8"
    And I attach the file "/data/staging/culture/pict1.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I click random XPATH element "//div[3]/div/div/div/div[%d]/input" with range from "1" to "6"
    And I click random XPATH element "//div[%s]/input" with range from "7" to "14"
    And I fill in "edit-field-tag-und" with random value of length "7"
    And I select "PL" from "edit-language"
    And I scroll Name "language" into view
    And I click XPATH element "//div[5]/div/div/div[2]/label"
    And I click random XPATH element "//div[6]/div/div/div[%s]/label" with range from "1" to "6"
    And I fill in "edit-field-url-und-0-url" with "www.onet.pl"
    And I fill in "edit-body-und-0-value" with random value of length "15"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "FrontSlide" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a"
    When I fill in "edit-title" with random value to assert of length "8"
    And I click random XPATH element "//div[3]/div/div/div/div[%d]/input" with range from "1" to "6"
    And I fill in "edit-field-tag-und" with random value of length "8"
    And I select "PL" from "edit-language"
    And I scroll Name "language" into view
    And I click XPATH element "//div[5]/div/div/div[2]/label"
    And I click random XPATH element "//div[6]/div/div/div[%s]/label" with range from "1" to "6"
    And I fill in "edit-field-url-und-0-url" with "www.wp.pl"
    And I fill in "edit-body-und-0-value" with random value of length "16"
    And I fill in "edit-log" with random value of length "12"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see " (FrontSlide) został zaktualizowany."
    And I should see that page contains random generated text

  @javascript
  Scenario: Remove front-slide
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/front-slide"
    When I fill in "edit-title" with random value to assert of length "8"
    And I attach the file "/data/staging/culture/pict1.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I click random XPATH element "//div[3]/div/div/div/div[%d]/input" with range from "1" to "6"
    And I click random XPATH element "//div[%s]/input" with range from "7" to "14"
    And I fill in "edit-field-tag-und" with random value of length "7"
    And I select "PL" from "edit-language"
    And I scroll Name "language" into view
    And I click XPATH element "//div[5]/div/div/div[2]/label"
    And I click random XPATH element "//div[6]/div/div/div[%s]/label" with range from "1" to "6"
    And I fill in "edit-field-url-und-0-url" with "www.onet.pl"
    And I fill in "edit-body-und-0-value" with random value of length "15"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "FrontSlide" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a[2]"
    Then I should see that page contains element with selector "xpath"  with locator "//em"  with random generated text
    And I should see text matching "Czy na pewno usunąć"
    And I should see text matching "Operacja jest nieodwracalna."
    When I press "op"
    Then I should see text matching "Usunięto wpis"
    And I should see that page contains element with selector "xpath"  with locator "//div/em"  with random generated text