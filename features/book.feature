Feature: Book

  Background:

  @javascript
  Scenario: Add book - check page
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    When I am on "/node/add/book"
    Then I should see text matching "Dodaj Strona książki"
    And I should see text matching "Title"
    And I should see "Opcje dostępu do domeny"
    And I should see text matching "Publikuj w"
    And I should see "Edycja podsumowania"
    And I should see text matching "Informacja o nowej wersji"

  @javascript
  Scenario: Add book
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/book"
    When I fill in "edit-title" with random value to assert of length "8"
    And I scroll ID "edit-domains-7" into view
    And I click XPATH element "//div[2]/div/div/div/span/span[2]/span/span[2]/a[2]"
    And I fill in XPATH field "//div/div/div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see text matching "Wpis"
    And I should see "(Strona książki) został dodany."
    And I should see that page contains random generated text

  @javascript
  Scenario: View book in content list
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/book"
    When I fill in "edit-title" with random value to assert of length "8"
    And I scroll ID "edit-domains-7" into view
    And I click XPATH element "//div[2]/div/div/div/span/span[2]/span/span[2]/a[2]"
    And I fill in XPATH field "//div/div/div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Strona książki" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    Then I should see that page contains element with selector "xpath"  with locator "//td[2]/a"  with random generated text
    And I should see "Strona książki" in the "td.views-field.views-field-type" element
    And I should see "Behat-redaktor" in the "a.username" element
    And I should see that page contains element with selector "xpath"  with locator "//td[6]"  with today's date
    And I should see "edytuj" in the "td.views-field.views-field-edit-node > a" element
    And I should see "usuń" in the "td.views-field.views-field-edit-node" element

  @javascript
  Scenario: Edit book
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/book"
    When I fill in "edit-title" with random value to assert of length "8"
    And I scroll ID "edit-domains-7" into view
    And I click XPATH element "//div[2]/div/div/div/span/span[2]/span/span[2]/a[2]"
    And I fill in XPATH field "//div/div/div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Strona książki" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a"
    When I fill in "edit-title" with random value to assert of length "8"
    And I scroll ID "edit-domains-7" into view
    And I click XPATH element "//div[2]/div/div/div/span/span[2]/span/span[2]/a[2]"
    And I fill in XPATH field "//div/div/div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see " (Strona książki) został zaktualizowany."
    And I should see that page contains random generated text

  @javascript
  Scenario: Remove book
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/book"
    When I fill in "edit-title" with random value to assert of length "8"
    And I scroll ID "edit-domains-7" into view
    And I click XPATH element "//div[2]/div/div/div/span/span[2]/span/span[2]/a[2]"
    And I fill in XPATH field "//div/div/div[2]/div/div/div/div/textarea" with random value of length "20"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Strona książki" from "type"
    And I select "-Wszystkie-" from "edit-language"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a[2]"
    Then I should see that page contains element with selector "xpath"  with locator "//em"  with random generated text
    And I should see text matching "Czy na pewno usunąć"
    And I should see text matching "Operacja jest nieodwracalna."
    When I press "op"
    Then I should see text matching "Usunięto wpis"
    And I should see that page contains element with selector "xpath"  with locator "//div/em"  with random generated text