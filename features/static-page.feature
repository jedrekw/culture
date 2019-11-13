Feature: Static Page

  Background:

  @javascript
  Scenario: Add static page - check page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    When I am on "/node/add/page"
    Then I should see text matching "Dodaj Statyczna strona"
    And I should see text matching "Tytuł"
    And I should see text matching "Język"
    And I should see text matching "Treść strony"
    And I should see text matching "Informacja o nowej wersji"
    And I should see text matching "Dodaj nowy plik"
    And I should see text matching "Publikuj w"
    And I should see text matching "Kategoria"
    And I should see text matching "Tagi"

  @javascript
  Scenario: Add static page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/page"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-file-und-0-upload"
#    DO ZMIANY ADRESU (PDF)
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-field-tag-und" with "100 Artists of Tomorrow"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see text matching "Auto-publishing this revision."
    And I should see text matching "Wpis"
    And I should see "(Statyczna strona) został dodany."
    And I should see that page contains random generated text

  @javascript
  Scenario: View static page in content list
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/page"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
#    And I attach the file "C:/pict.png" to the "edit-field-file-und-0-upload"
#    DO ZMIANY ADRESU (PDF)
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-field-tag-und" with "100 Artists of Tomorrow"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Statyczna strona" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    Then I should see that page contains element with selector "xpath"  with locator "//td[2]/a"  with random generated text
    And I should see "Statyczna strona" in the "td.views-field.views-field-type" element
    And I should see "Behat-redaktor" in the "a.username" element
    And I should see that page contains element with selector "xpath"  with locator "//td[6]"  with today's date
    And I should see "edytuj" in the "td.views-field.views-field-edit-node > a" element
    And I should see "usuń" in the "td.views-field.views-field-edit-node" element

  @javascript
  Scenario: Edit static page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/page"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
#    And I attach the file "C:/pict.png" to the "edit-field-file-und-0-upload"
#    DO ZMIANY ADRESU (PDF)
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-field-tag-und" with "100 Artists of Tomorrow"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Statyczna strona" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a"
    When I fill in "edit-title" with random value to assert of length "9"
    And I select "PL" from "edit-language"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "21"
    And I fill in "edit-field-category-und" with "Film"
    And I fill in "edit-field-tag-und" with "#idathefilm"
    And I fill in "edit-log" with random value of length "11"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see " (Statyczna strona) został zaktualizowany."
    And I should see that page contains random generated text

  @javascript
  @now
  Scenario: Remove static page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/page"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
#    And I attach the file "C:/pict.png" to the "edit-field-file-und-0-upload"
#    DO ZMIANY ADRESU (PDF)
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-field-tag-und" with "100 Artists of Tomorrow"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Statyczna strona" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a[2]"
    Then I should see that page contains element with selector "xpath"  with locator "//em"  with random generated text
    And I should see text matching "Czy na pewno usunąć"
    And I should see text matching "Operacja jest nieodwracalna."
    When I press "op"
    Then I should see text matching "Usunięto wpis"
    And I should see that page contains element with selector "xpath"  with locator "//div/em"  with random generated text