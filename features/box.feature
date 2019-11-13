Feature: Box

  Background:

  @javascript
  Scenario: Add box - check page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    When I am on "/node/add/box"
    Then I should see text matching "Dodaj Box"
    And I should see text matching "Title"
    And I should see text matching "Język"
    And I should see text matching "URL boksu"
    And I should see text matching "Tło Boksu"
    And I should see text matching "Typ Boxu"
    And I should see text matching "Rodzaj Boxu"
    And I should see "Opcje dostępu do domeny"
    And I should see text matching "Publikuj w"
    And I should see text matching "Informacja o nowej wersji"

  @javascript
  Scenario: Add box
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/box"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-url-und-0-title" with random value of length "12"
    And I fill in "edit-field-url-und-0-url" with "www.onet.pl"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I click XPATH element "//div[5]/div/div/div/label"
    And I click XPATH element "//div[6]/div/div/div[2]/label"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see text matching "Wpis"
    And I should see "(Box) został dodany."
    And I should see that page contains random generated text

  @javascript
  Scenario: View box in content list
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/box"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-url-und-0-title" with random value of length "12"
    And I fill in "edit-field-url-und-0-url" with "www.onet.pl"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I click XPATH element "//div[5]/div/div/div/label"
    And I click XPATH element "//div[6]/div/div/div[2]/label"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Box" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    Then I should see that page contains element with selector "xpath"  with locator "//td[2]/a"  with random generated text
    And I should see "Box" in the "td.views-field.views-field-type" element
    And I should see "Behat-redaktor" in the "a.username" element
    And I should see that page contains element with selector "xpath"  with locator "//td[6]"  with today's date
    And I should see "edytuj" in the "td.views-field.views-field-edit-node > a" element
    And I should see "usuń" in the "td.views-field.views-field-edit-node" element

  @javascript
  Scenario: Edit box
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/box"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-url-und-0-title" with random value of length "12"
    And I fill in "edit-field-url-und-0-url" with "www.onet.pl"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I click XPATH element "//div[5]/div/div/div/label"
    And I click XPATH element "//div[6]/div/div/div[2]/label"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Box" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a"
    When I fill in "edit-title" with random value to assert of length "9"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-url-und-0-title" with random value of length "10"
    And I fill in "edit-field-url-und-0-url" with "www.wp.pl"
    And I click XPATH element "//div[5]/div/div/div/label"
    And I click XPATH element "//div[6]/div/div/div[2]/label"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see " (BOx) został zaktualizowany."
    And I should see that page contains random generated text

  @javascript
  Scenario: Remove box
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/box"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-url-und-0-title" with random value of length "12"
    And I fill in "edit-field-url-und-0-url" with "www.onet.pl"
    And I attach the file "C:/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I click XPATH element "//div[5]/div/div/div/label"
    And I click XPATH element "//div[6]/div/div/div[2]/label"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Box" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a[2]"
    Then I should see that page contains element with selector "xpath"  with locator "//em"  with random generated text
    And I should see text matching "Czy na pewno usunąć"
    And I should see text matching "Operacja jest nieodwracalna."
    When I press "op"
    Then I should see text matching "Usunięto wpis"
    And I should see that page contains element with selector "xpath"  with locator "//div/em"  with random generated text