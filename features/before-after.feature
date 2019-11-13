Feature: Before-After

  Background:

  @javascript
  Scenario: Add before-after - check page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    When I am on "/node/add/beforeafter"
    Then I should see text matching "Dodaj Porównanie wczoraj i dziś"
    And I should see text matching "Tytuł"
    And I should see "Opcje dostępu do domeny"
    And I should see text matching "Publikuj w"
    And I should see "Obraz wczoraj"
    And I should see "Obraz dziś"
    And I should see text matching "Informacja o nowej wersji"

  @javascript
  Scenario: Add before-after
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/beforeafter"
    When I fill in "edit-title" with random value to assert of length "8"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see text matching "Wpis"
    And I should see "(Porównanie wczoraj i dziś) został dodany."
    And I should see that page contains random generated text

  @javascript
  Scenario: View before-after in content list
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/beforeafter"
    When I fill in "edit-title" with random value to assert of length "8"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Porównanie wczoraj i dziś" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    Then I should see that page contains element with selector "xpath"  with locator "//td[2]/a"  with random generated text
    And I should see "Porównanie wczoraj i dziś" in the "td.views-field.views-field-type" element
    And I should see "Behat-redaktor" in the "a.username" element
    And I should see that page contains element with selector "xpath"  with locator "//td[6]"  with today's date
    And I should see "edytuj" in the "td.views-field.views-field-edit-node > a" element
    And I should see "usuń" in the "td.views-field.views-field-edit-node" element

  @javascript
  Scenario: Edit before-after
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/beforeafter"
    When I fill in "edit-title" with random value to assert of length "8"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Porównanie wczoraj i dziś" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a"
    When I fill in "edit-title" with random value to assert of length "8"
    And I press "field_image2_und_0_remove_button"
    And I attach the file "/data/staging/culture/pict1.png" to the "edit-field-image2-und-0-upload"
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see " (Porównanie wczoraj i dziś) został zaktualizowany."
    And I should see that page contains random generated text

  @javascript
  Scenario: Remove before-after
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/beforeafter"
    When I fill in "edit-title" with random value to assert of length "8"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Porównanie wczoraj i dziś" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a[2]"
    Then I should see that page contains element with selector "xpath"  with locator "//em"  with random generated text
    And I should see text matching "Czy na pewno usunąć"
    And I should see text matching "Operacja jest nieodwracalna."
    When I press "op"
    Then I should see text matching "Usunięto wpis"
    And I should see that page contains element with selector "xpath"  with locator "//div/em"  with random generated text